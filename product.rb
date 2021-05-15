class Product

  attr_accessor :price, :amount

  def initialize(params)
    @price = params[:price]
    @amount = params[:amount]
  end

  def self.read_from_xml(file_name)
    file_path = File.dirname(__FILE__) + "/" + file_name
    unless File.exist?(file_path)
      abort "Файл #{file_path} не найден"
    end
    file = File.new(file_name)
    doc = REXML::Document.new(file)
    file.close
    result = []
    product = nil
    doc.elements.each("products/product") do |product_node|
      price = product_node.attributes["price"].to_i
      amount_available = product_node.attributes["amount_available"].to_i

      product_node.each_element("book") do |book_node|
        product = Book.new(price: price, amount: amount_available)
        product.update(
            title: book_node.attributes["title"],
            author_name: book_node.attributes["author_name"]
        )
      end

      product_node.each_element("movie") do |movie_node|
        product = Movie.new(price: price, amount: amount_available)
        product.update(
            title: movie_node.attributes["title"],
            director_name: movie_node.attributes["director_name"],
            year: movie_node.attributes["year"]
        )
      end

      product_node.each_element("disk") do |disk_node|
        product = Disk.new(price: price, amount: amount_available)
        product.update(
            album_name: disk_node.attributes["album_name"],
            artist_name: disk_node.attributes["artist_name"],
            genre: disk_node.attributes["genre"]
        )
      end
      result.push(product)
    end
    result
  end

  def self.showcase(products)
    puts "Хотите что-нибудь купить?"
    puts
    products.each_with_index { |product, index| puts "#{index}: #{product.show}" }
    puts "x. Покинуть магазин"
    puts
  end

  def info
  end

  def buy
    if @amount > 0
      puts "* * *"
      puts "Вы купили товар #{info}"
      puts "* * *\n\n"

      @amount -= 1
      price
    else
      puts "К сожалению, больше нет"
      0
    end
  end

  def show
    "#{info} - #{@price} руб. (осталось #{@amount})"
  end

  def update(params)
    @price = params[:price] if params[:price]
    @amount = params[:amount] if params[:amount]
  end
end