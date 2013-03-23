class Artist < ActiveRecord::Base
  attr_accessible :bio, :email, :name, :photo_url, :site_title
  belongs_to :admin, inverse_of: :artist

  validates :admin_id, presence: true

  before_save do |artist|
    artist.name = "" if artist.name == nil
    artist.bio = "" if artist.bio == nil
    artist.site_title = "Glittery" if artist.site_title == nil
  end
end
