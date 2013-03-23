module ApplicationHelper
  def site_title
    Admin.external_config_admin.artist.site_title
  end
end
