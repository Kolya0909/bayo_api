class UpdateBasketsTable < ActiveRecord::Migration[7.0]
  def up
    remove_column :baskets, :user_id
    add_column :baskets, :customer_id, :integer
  end

  def down
    add_column :baskets, :user_id, :integer
    remove_column :baskets, :customer_id
  end
end
