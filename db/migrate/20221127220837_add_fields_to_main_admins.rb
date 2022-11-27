class AddFieldsToMainAdmins < ActiveRecord::Migration[7.0]
  def change
    add_column :main_admins, :password_confirmation, :string
  end
end
