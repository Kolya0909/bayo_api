class AddAvatarFieldToMAinAdmins < ActiveRecord::Migration[6.0]
  def change
    add_attachment :main_admins, :avatar
  end
end
