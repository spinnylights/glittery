# == Schema Information
#
# Table name: artworks
#
#  id          :integer          not null, primary key
#  image       :attachment
#  name        :string(255)
#  description :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Artwork < ActiveRecord::Base
  attr_accessible :description, :image, :name
  has_attached_file :image, styles: { full: '990x990>', gallery: '200x200' },  
                            url: '/art/:style/:filename', 
                            path: ':rails_root/public/art/:style/:filename'
  belongs_to :artist

  validates :image, attachment_presence: { if: :image, 
                      message: "^Please select an image to upload." }
end
