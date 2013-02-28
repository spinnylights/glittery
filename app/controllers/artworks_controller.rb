class ArtworksController < ApplicationController
  def index
    @artworks = Artwork.all
  end

  def show
    @artwork = Artwork.find(params[:id])
  end

  def new
  end
  
  def destroy 
    Artwork.find(params[:id]).destroy
    redirect_to '/' 
  end
end
