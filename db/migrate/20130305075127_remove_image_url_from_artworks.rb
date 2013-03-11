class RemoveImageUrlFromArtworks < ActiveRecord::Migration
  def up
    remove_column :artworks, :image_url
  end

  def down
    add_column :artworks, :image_url, :string
  end
end
