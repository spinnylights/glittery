module ApplicationHelper
  def signed_in?
    Artist.only_artist(:remember_token) && 
      cookies[:remember_token] == Artist.only_artist(:remember_token) 
  end
end
