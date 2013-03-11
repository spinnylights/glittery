class AddImageToArtworks < ActiveRecord::Migration
  def change
    add_attachment :artworks, :image
  end
end
