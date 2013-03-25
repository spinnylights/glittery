module ApplicationHelper
  def site_title
    Admin.external_config_admin.artist.site_title
  end

  def artist_has_no_info?
    artist = Admin.external_config_admin.artist
    if artist.name == "" && artist.bio == "" && 
    artist.photo_file_name == nil && artist.email.blank? 
      return true
    else
      return false
    end
  end
end
