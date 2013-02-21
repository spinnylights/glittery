class ArtistsController < ApplicationController
  def show
    @artist = @@artist
  end
  
  def edit
    if !@@artist.remember_token || 
    cookies[:remember_token] != @@artist.remember_token 
      redirect_to '/login'
    end
  end
end
