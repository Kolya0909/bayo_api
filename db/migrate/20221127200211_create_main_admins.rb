class CreateMainAdmins < ActiveRecord::Migration[7.0]
  def change
    create_table :main_admins do |t|
      t.string :name
      t.string :password
      t.string :email

      t.timestamps
    end
  end
end
