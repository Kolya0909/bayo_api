class RemoveAnyFieldInMainAdmins < ActiveRecord::Migration[7.0]
  def change
    remove_column :main_admins, :password
    remove_column :main_admins, :password_confirmation
  end
end
