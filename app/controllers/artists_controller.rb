class ArtistsController < ApplicationController
  def show
    @artist = Admin.external_config_admin.artist 
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
    if params[:artist][:name]
      Artist.only_artist(:name=, "params[:artist][:name]")
      Artist.only_artist(:email=,"params[:artist][:email]")
      Artist.only_artist(:site_title=, "params[:artist][:site_title]")
      Artist.only_artist(:bio=, "params[:artist][:bio]")
      redirect_to edit_artist_path
    end
  end
end
