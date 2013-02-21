class Artist < ActiveRecord::Base
  attr_accessible :bio, :email, :name, :photo_url, :password,
   :password_confirmation, :remember_token
  has_secure_password

  def create_remember_token
    self.remember_token = SecureRandom.urlsafe_base64
  end

  def destroy_remember_token
    self.remember_token = nil
  end

  def artist
    Artist.find_by_id(1)
  end
end
