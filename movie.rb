class Movie < Product

  def update(params)
    @title = params[:title] if params[:title]
    @director_name = params[:director_name] if params[:director_name]
    @year = params[:year]
  end

  def info
    "Фильм «#{@title}», #{@year}, реж. #{@director_name})"
  end


end