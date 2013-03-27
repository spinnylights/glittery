class Admin < ActiveRecord::Base
  attr_accessible :password, :username, :new_password, :password_confirmation,
                  :external
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

  validates_presence_of :password_confirmation

  validates_uniqueness_of :external, message: "can only be set for one admin"

  # Callbacks:

  before_create :create_remember_token

  after_create :create_artist

  # Class methods:
 
  def self.external_config_admin
    if File.exists?("config/admin.yml")
      file = Psych.load(File.open("config/admin.yml"))
      new_external_config_admin = Admin.new(username: file[:username], 
                                            password: file[:password],
                               password_confirmation: file[:password])
      File.delete("config/admin.yml")
      if new_external_config_admin.save
         # Maybe change to destroy to prevent unused records floating around?
         if current_config_admin = Admin.find_by_external(true)
           current_config_admin.toggle!(:external)
         end
         new_external_config_admin.toggle!(:external)
         new_external_config_admin
      end
    else
      Admin.find_by_external(true)
    end
  end
  
  private

    def create_remember_token
      self.remember_token = SecureRandom.urlsafe_base64
    end
end
