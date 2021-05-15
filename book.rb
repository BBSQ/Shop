class Book < Product

  def update(params)
    @title = params[:title] if params[:title]
    @author_name = params[:author_name] if params[:author_name]
  end

  def info
    "Книга «#{@title}», автор — #{@author_name})"
  end
end