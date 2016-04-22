class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.integer :item_id
      t.integer :bill_id
      t.timestamps null: false
    end
  end
end
