class Artist < ActiveRecord::Base
  attr_accessible :bio, :email, :name, :photo_url, :site_title
  belongs_to :admin, inverse_of: :artist

  validates :admin_id, presence: true

  before_save do |artist|
    artist.name = ""
    artist.bio = ""
    artist.site_title = "Glittery"
  end
end
