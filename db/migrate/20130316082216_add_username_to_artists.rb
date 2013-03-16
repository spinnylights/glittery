class AddUsernameToArtists < ActiveRecord::Migration
  def change
    add_column :artists, :username, :string
  end
end
