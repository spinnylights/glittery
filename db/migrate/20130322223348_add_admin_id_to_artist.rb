class AddAdminIdToArtist < ActiveRecord::Migration
  def up
    change_table :artists do |a|
      a.references :admin
    end
  end

  def down
    remove_column :artists, :admin_id
  end
end
