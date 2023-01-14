class CreateProductInfos < ActiveRecord::Migration[7.0]
  def change
    create_table :product_infos do |t|
      t.string :title
      t.text :description
      t.string :screen
      t.string :processor
      t.string :ram
      t.string :memory
      t.string :camera
      t.integer :product_id
      t.timestamps
    end
  end
end
