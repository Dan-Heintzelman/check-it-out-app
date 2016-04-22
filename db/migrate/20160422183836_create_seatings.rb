class CreateSeatings < ActiveRecord::Migration
  def change
    create_table :seatings do |t|
      t.integer :customer_id
      t.integer :merchant_id
      t.boolean :assigned
      t.integer :bill_id
      t.timestamps null: false
    end
  end
end
