  class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.integer :merchant_id, null: false
      t.string :item_description, null: false
      t.decimal :price, precision: 8, scale: 2
      t.integer :int_price
      t.timestamps null: false
    end
  end
end
