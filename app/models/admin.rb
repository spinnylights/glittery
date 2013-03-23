class Admin < ActiveRecord::Base
  attr_accessible :password, :username
  has_secure_password
  has_one :artist, inverse_of: :admin

  validates :username, presence: true, length: { minimum: 6 }
  VALID_PASSWORD_REGEX = /((?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@#\$\!]).{8,})/
  validates :password, presence: true, length: { minimum: 8 },
                       format: { with: VALID_PASSWORD_REGEX }

  before_save :create_remember_token
  before_save do |admin|
    admin.create_artist
  end

  def populate_attr_from_config 
    File.open("config/admin.yml") do |file|
      attributes = Psych.load(file)
      self.username = attributes[:username]
      self.password = attributes[:password]
    end
  end

  private

    def create_remember_token
      self.remember_token = SecureRandom.urlsafe_base64
    end
end
