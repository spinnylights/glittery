class CreateArtworks < ActiveRecord::Migration
  def change
    create_table :artworks do |t|
      t.string :image_url
      t.string :name
      t.text :description

      t.timestamps
    end
  end
end
