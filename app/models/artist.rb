class Artist < ActiveRecord::Base
  attr_accessible :bio, :email, :name, :photo_url
end
