class ArtistsController < ApplicationController
  def show
    @artist = Artist.only_artist
  end
  
  def edit
    if !signed_in? 
      redirect_to '/login'
    end
  end

  def password
    if !signed_in?
      redirect_to '/login'
    end
  end

  def info
    if !signed_in?
      redirect_to '/login'
    end
  end

  def update
    if params[:artist][:new_password]
      if Artist.only_artist(:authenticate, "params[:artist][:password]")
        if params[:artist][:new_password] == 
           params[:artist][:password_confirmation]
          Artist.only_artist(:password=, "params[:artist][:new_password]")
          Artist.only_artist(:new_password=, "nil")
          Artist.only_artist(:password_confirmation=, "nil")
          redirect_to edit_artist_path 
        else
          flash[:error] = 'New password does not match confirmation'
          redirect_to password_artist_path
        end
      else
        flash[:error] = 'Wrong current password'
        redirect_to password_artist_path
      end
    end

    if params[:artist][:name]
      Artist.only_artist(:name=, "params[:artist][:name]")
      Artist.only_artist(:email=,"params[:artist][:email]")
      Artist.only_artist(:site_title=, "params[:artist][:site_title]")
      Artist.only_artist(:bio=, "params[:artist][:bio]")
      redirect_to edit_artist_path
    end
  end
end
