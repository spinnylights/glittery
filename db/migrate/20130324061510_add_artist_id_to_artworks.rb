class AddArtistIdToArtworks < ActiveRecord::Migration
  def up
    change_table :artworks do |a|
      a.references :artist
    end
  end

  def down
    remove_column :artworks, :artist_id
  end
end
