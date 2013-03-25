class ArtworksController < ApplicationController
  def index
    @artworks = Artwork.all
  end

  def new
    if !signed_in?
      redirect_to '/login'
    end
    @artwork = Artwork.new
  end

  def create
    @artwork = Artwork.new(params[:artwork])
    if @artwork.save
      redirect_to '/'
    else
      render 'new'
    end
  end

  def show
    @artwork = Artwork.find(params[:id])
  end
  
  def edit
    if !signed_in?
      redirect_to '/login'
    end
    @artwork = Artwork.find(params[:id])
  end

  def update
    @artwork = Artwork.find_by_id(params[:id])
    @artwork.update_attributes(params[:artwork])
    redirect_to '/'
  end

  def destroy 
    Artwork.find(params[:id]).destroy
    redirect_to '/' 
  end
end
