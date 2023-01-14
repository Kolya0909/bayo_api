class CreateCategories < ActiveRecord::Migration[7.0]
  def change
    create_table :categories do |t|
      t.string :title
      t.attachment :company_icon
      t.timestamps
    end
  end
end
