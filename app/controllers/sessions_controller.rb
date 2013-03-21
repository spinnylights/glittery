class SessionsController < ApplicationController
  def new
    if signed_in?
      redirect_to edit_artist_path
    end
    Artist.only_artist(:login_setup)
  end

  def create
    if Artist.only_artist && Artist.only_artist(:authenticate, 
                                                params[:password]) 
      Artist.only_artist(:create_remember_token)
      if params[:remember_me]
        cookies.permanent[:remember_token] = 
        Artist.only_artist(:remember_token)
      else
        cookies[:remember_token] = Artist.only_artist(:remember_token)
      end
      redirect_to edit_artist_path
    else
      flash.now[:error] = 'Wrong username/password'
      render 'new'
    end
  end

  def destroy
    cookies.delete(:remember_token)
    Artist.only_artist(:destroy_remember_token)
    redirect_to root_url
  end
end
