class AddAvailabilitytFieldToProducts < ActiveRecord::Migration[7.0]
  def change
    add_column :products, :availability, :integer, default: 5
  end
end
