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
  has_attached_file :image, { url: '/art/:filename' }

  validates :image, attachment_presence: { if: :image, 
                      message: "^Please select an image to upload." }
end
