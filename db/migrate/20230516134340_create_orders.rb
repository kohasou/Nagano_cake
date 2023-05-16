class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|

      enum payment_method: { credit_card: 0, bank: 1 }
      t.integer :customer_id, null: false
      t.string :delivery_address, null: false
      t.string :delivery_name, null: false
      t.string :delivery_postal_code, null: false
      t.integer :billing_amount, null: false
      t.integer :postage, null: false

      t.timestamps
    end
  enda
end
