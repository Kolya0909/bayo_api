class AddUserToRatings < ActiveRecord::Migration[7.0]
  def up
    change_table :ratings do |t|
      t.references :user, polymorphic: true
    end
  end
  def down
    t.remove_references :user, polymorphic: true
  end
end
