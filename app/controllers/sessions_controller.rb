class SessionsController < ApplicationController
  def new
  end

  def create
    artist = Artist.find_by_id(1)
    if artist && artist.authenticate(params[:password])
      # Sign in the artist
    else
      flash.now[:error] = 'Wrong username/password'
      render 'new'
    end
  end
end
