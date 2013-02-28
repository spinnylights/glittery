class AddNewPasswordToArtist < ActiveRecord::Migration
  def change
    add_column :artists, :new_password, :string
  end
end
