class Admin < ActiveRecord::Base
  attr_accessible :password, :username, :new_password, :password_confirmation
  has_secure_password
  has_one :artist, inverse_of: :admin

  validates :username, presence: true, length: { minimum: 6 }, 
                       uniqueness: true
  VALID_PASSWORD_REGEX = /((?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@#\$\!]).{8,})/
  validates :password, presence: true, length: { minimum: 8 },
                       format: { with: VALID_PASSWORD_REGEX }

  before_save :create_remember_token
  after_create do |admin|
    admin.create_artist
  end

  def populate_attr_from_config 
    File.open("config/admin.yml") do |file|
      attributes = Psych.load(file)
      self.username = attributes[:username]
      self.password = attributes[:password]
    end
  end

  def self.external_config_admin
    file = Psych.load(File.open("config/admin.yml"))
    new_external_config_admin = Admin.create(username: file[:username], 
                                             password: file[:password])
    if new_external_config_admin.valid?
       new_external_config_admin
    else
      Admin.find_by_username(file[:username])
    end
  end

  def destroy_remember_token
      self.remember_token = nil
  end

  private

    def create_remember_token
      self.remember_token = SecureRandom.urlsafe_base64
    end
end
