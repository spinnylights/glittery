class Artist < ActiveRecord::Base
  attr_accessible :bio, :email, :name, :username, :photo_url, :password,
   :password_confirmation, :remember_token, :site_title
  has_secure_password

  def create_remember_token
    self.remember_token = SecureRandom.urlsafe_base64
  end

  def destroy_remember_token
    self.remember_token = nil
  end

  def login_setup
    File.open("config/admin.yml") do |file|
      attributes = Psych.load(file)
      self.username = attributes[:username]
      self.password = attributes[:password]
    end
  end
end
