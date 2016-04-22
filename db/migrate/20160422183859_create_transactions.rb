class CreateTransactions < ActiveRecord::Migration
  def change
    create_table :transactions do |t|
      t.integer :bill_id
      t.integer :customer_id
      t.decimal :amount, precision: 8, scale: 2
      t.timestamps null: false
    end
  end
end