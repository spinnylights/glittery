class ArtistsController < ApplicationController
  def show
    @artist = @@artist
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

  def update
    if @@artist.authenticate(params[:artist][:password])
      if params[:artist][:new_password] == 
         params[:artist][:password_confirmation]
        @@artist.password = params[:artist][:new_password]
        @@artist.new_password = nil
        @@artist.password_confirmation = nil
        @@artist.save
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
end
