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
      current_admin.artist.update_attributes(params[:artist])
      redirect_to edit_admin_path
    end
  end
end
