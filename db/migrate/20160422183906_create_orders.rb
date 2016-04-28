class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.integer :item_id, null: false
      t.integer :bill_id, null: false
      t.integer :transaction_id, null: false
      t.timestamps null: false
    end
  end
end
