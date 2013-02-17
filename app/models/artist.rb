class Artist < ActiveRecord::Base
  attr_accessible :bio, :email, :name, :photo_url, :password,
    :password_confirmation
  has_secure_password
end
