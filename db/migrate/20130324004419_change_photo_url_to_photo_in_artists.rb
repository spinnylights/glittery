class ChangePhotoUrlToPhotoInArtists < ActiveRecord::Migration
  def up
    change_table :artists do |a|
      a.remove(:photo_url)
      a.attachment(:photo)
    end
  end

  def down
    change_table :artists do |a|
      a.remove(:photo)
      a.column(:photo_url, :string)
    end
  end
end
