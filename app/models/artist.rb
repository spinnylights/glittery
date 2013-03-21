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
    self.save
  end

  # This method allows Artist to behave like a singleton class but
  # still inheret from ActiveRecord::Base.

  def self.only_artist(meth = nil, *args)
    the_artist = Artist.first

    if meth == nil
      return the_artist
    end
    
    unless meth.is_a? Symbol || String
      raise TypeError, "Symbol or string expected as first argument" 
    end

    m = the_artist.method(meth)
    to_return = m.call(*args)
    if meth =~ /[a-zA-Z\d_]{1,}=/
      the_artist.save
    end
    to_return
  end
end
