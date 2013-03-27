class AddExternalToAdmin < ActiveRecord::Migration
  def change
    add_column :admins, :external, :boolean, default: false
  end
end
