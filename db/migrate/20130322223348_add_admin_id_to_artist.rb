class AddAdminIdToArtist < ActiveRecord::Migration
  change_table :artists do |a|
    a.references :admin
  end
end
