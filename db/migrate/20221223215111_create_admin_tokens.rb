class CreateAdminTokens < ActiveRecord::Migration[7.0]
  def change
    create_table :admin_tokens do |t|
      t.bigint :main_admin_id
      t.string :token
      t.timestamps
    end
  end
end
