class AddFieldPasswordDigestToMainAdmins < ActiveRecord::Migration[7.0]
  def change
    add_column :main_admins, :password_digest, :string
  end
end
