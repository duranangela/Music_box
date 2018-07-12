class ArtistsController < ApplicationController

  def index
    @artists = Artist.all
  end

  def new
    @artist = Artist.new
  end

  def create
    @artist = Artist.create(artist_params)
    if @artist.save
      redirect_to '/artists'
    else
      render '/artists/new'
    end
  end

  def show
    @artist = Artist.find(params[:id])
    @songs = @artist.songs
  end

  private

    def artist_params
      params.require(:artist).permit(:name)
    end

end
