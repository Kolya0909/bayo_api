class CreateProducts < ActiveRecord::Migration[7.0]
  def change
    create_table :products do |t|
      t.string :name
      t.integer :price
      t.string :rating, default: 0
      t.integer :company_id
      t.timestamps
    end
  end
end
