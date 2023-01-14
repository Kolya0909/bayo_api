class AddProductsCategoriesTable < ActiveRecord::Migration[7.0]
  def change
    create_join_table :products, :categories do |t|

      t.timestamps
    end
  end
end
