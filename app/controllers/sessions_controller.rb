class SessionsController < ApplicationController
  def new
    if @@artist.remember_token && 
    cookies[:remember_token] = @@artist.remember_token 
      redirect_to edit_artist_path
    end
  end

  def create
    if @@artist && @@artist.authenticate(params[:password])
    @@artist.create_remember_token
      if params[:remember_me]
        cookies.permanent[:remember_token] = @@artist.remember_token
      else
        cookies[:remember_token] = @@artist.remember_token
      end
      redirect_to edit_artist_path
    else
      flash.now[:error] = 'Wrong username/password'
      render 'new'
    end
  end

  def destroy
    cookies.delete(:remember_token)
    @@artist.destroy_remember_token
    redirect_to root_url
  end
end
