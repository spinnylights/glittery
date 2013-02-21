class ApplicationController < ActionController::Base
  protect_from_forgery
  @@artist = Artist.find_by_id(1)
end
