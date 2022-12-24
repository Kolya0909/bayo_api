class CreateCompanies < ActiveRecord::Migration[7.0]
  def change
    create_table :companies do |t|
      t.string :title
      t.text :description
      t.attachment :logo
      t.string :country
      t.integer :company_type
      t.bigint :main_admin_id
      t.string :time_of_send_order
      t.string :time_of_send_delivery
      t.timestamps
    end
  end
end
