class Disk < Product

  def update(params)
    @artist_name = params[:artist_name]
    @album_name = params[:album_name]
    @genre = params[:genre]
  end

  def info
    "Диск #{@artist_name} — #{@album_name}(#{@genre}))"
  end

end