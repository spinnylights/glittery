class Admin < ActiveRecord::Base
  attr_accessible :password, :username, :new_password, :password_confirmation
  has_secure_password
  has_one :artist, inverse_of: :admin

  # Validations:
 
  validates :username, presence: true, 
                       length: { minimum: 6, 
        too_short: "must be at least %{count} characters" }, 
                       uniqueness: true

  VALID_PASSWORD_REGEX = 
  /((?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@#\$\!]).{8,})/

  validates :password, presence: true, length: { minimum: 8,
        too_short: "must be at least %{count} characters" }, 
                       format: { with: VALID_PASSWORD_REGEX,
 message: "must contain at least one lowercase letter, at 
 least one capital letter, at least one number, and at least one of 
 the following: @#!$"},
                       confirmation: true

  validates :password_confirmation, presence: true

  # Callbacks:

  before_create :create_remember_token

  after_create :create_artist

  after_save do |admin|
    File.open("config/admin.yml", "w") do |file|
      file.puts "---"
      file.puts "!ruby/sym username: #{admin.username}"
      file.puts "!ruby/sym password: #{admin.password}"
    end
  end

  # Instance methods:

  def populate_attr_from_config 
    File.open("config/admin.yml") do |file|
      attributes = Psych.load(file)
      self.username = attributes[:username]
      self.password = attributes[:password]
    end
  end
 
  # Class methods:
 
  def self.external_config_admin
    file = Psych.load(File.open("config/admin.yml"))
    new_external_config_admin = 
                Admin.create(username: file[:username], 
                             password: file[:password],
                             password_confirmation: file[:password])
    if new_external_config_admin.valid?
       new_external_config_admin
    else
      Admin.find_by_username(file[:username])
    end
  end
  
  private

    def create_remember_token
      self.remember_token = SecureRandom.urlsafe_base64
    end
end
