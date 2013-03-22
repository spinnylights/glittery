class Admin < ActiveRecord::Base
  attr_accessible :password, :username
  has_secure_password

  validates :username, presence: true, length: { minimum: 6 }
  VALID_PASSWORD_REGEX = /((?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@#\$\!]).{8,})/
  validates :password, presence: true, length: { minimum: 8 },
                       format: { with: VALID_PASSWORD_REGEX }
end
