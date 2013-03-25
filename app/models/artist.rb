class Artist < ActiveRecord::Base
  attr_accessible :bio, :email, :name, :photo, :site_title, 
  has_attached_file(:photo, { url: '/artist/:filename' })

  belongs_to :admin, inverse_of: :artist
  has_many :artworks, dependent: :destroy

  validates :admin_id, presence: true

  before_save do |artist|
    artist.name = "" if artist.name == nil
    artist.bio = "" if artist.bio == nil
    artist.site_title = "Glittery" if artist.site_title == nil
  end
end
