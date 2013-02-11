class CreateArtists < ActiveRecord::Migration
  def change
    create_table :artists do |t|
      t.string :name
      t.string :photo_url
      t.string :email
      t.text :bio

      t.timestamps
    end
  end
end
