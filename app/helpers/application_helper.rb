module ApplicationHelper

  @@artist = Artist.find_by_id(1)

  def signed_in?
    @@artist.remember_token && 
      cookies[:remember_token] = @@artist.remember_token 
  end

end
