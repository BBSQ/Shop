require_relative 'lib/product'
require_relative 'lib/book'
require_relative 'lib/film'
require_relative 'lib/product_collection'

current_path = File.dirname(__FILE__)
collection = ProductCollection.from_dir(current_path + '/data')
collection.sort!(by: :price, order: :asc)
collection.to_a.each do |product|
  puts product
end