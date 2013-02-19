class SessionsController < ApplicationController
  def new
    if # artist is logged in
      redirect_to edit_artist_path
    end
  end

  def create
    artist = Artist.find_by_id(1)
    if artist && artist.authenticate(params[:password])
      if params[:remember_me]
        cookies.permanent[:remember_token] = artist.remember_token
      else
        cookies[:remember_token] = artist.remember_token
      end
      redirect_to edit_artist_path
    else
      flash.now[:error] = 'Wrong username/password'
      render 'new'
    end
  end

  def destroy
    cookies.delete(:remember_token)
    redirect_to root_url
  end
end
