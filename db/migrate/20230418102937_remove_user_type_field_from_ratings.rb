class RemoveUserTypeFieldFromRatings < ActiveRecord::Migration[7.0]
  def change
    remove_column :ratings, :user_type
  end
end
