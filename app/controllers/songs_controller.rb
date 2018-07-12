class SongsController < ApplicationController

  def index
    @songs = Song.all
  end

  def new
    @artist = Artist.find(params[:artist_id])
    @song = @artist.songs.new
  end

  def create
    if Song.create(song_params)
      redirect_to songs_path
    else
      render :new
    end
  end

  private
    def song_params
      params.require(:song).permit(:title, :length, :play_count, :artist_id)
    end
end
