class AddOrderProductIdFieldToBasketProduct < ActiveRecord::Migration[7.0]
  def change
    add_column :basket_products, :order_product_id, :integer
  end
end
