class ArtistsController < ApplicationController
  def show
    @artist = Artist.find_by_id(1)
  end
  
  def edit
    if # artist is not logged in
      redirect_to '/login'
    end
  end
end
