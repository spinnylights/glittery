class AddNewPasswordAndPasswordConfirmationToAdmins < ActiveRecord::Migration
  def change
    add_column :admins, :new_password, :string
    add_column :admins, :password_confirmation, :string
  end
end
