class ArtistsController < ApplicationController
  def show
    @artist = Admin.external_config_admin.artist 
  end
  
  def edit
    if !signed_in? 
      redirect_to '/login'
    end
  end

  def update
    if current_admin.artist.update_attributes(params[:artist])
      redirect_to edit_admin_path
    else
      render 'edit'
    end
  end
end
