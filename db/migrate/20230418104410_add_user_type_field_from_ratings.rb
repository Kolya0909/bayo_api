class AddUserTypeFieldFromRatings < ActiveRecord::Migration[7.0]
  def change
    add_column :ratings, :user_type, :string
  end
end
