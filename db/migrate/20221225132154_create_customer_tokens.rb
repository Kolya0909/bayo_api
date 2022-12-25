class CreateCustomerTokens < ActiveRecord::Migration[7.0]
  def change
    create_table :customer_tokens do |t|
      t.bigint :customer_id
      t.text :token
      t.timestamps
    end
  end
end
