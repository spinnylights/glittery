class AddSiteTitleToArtist < ActiveRecord::Migration
  def change
    add_column :artists, :site_title, :string
  end
end
