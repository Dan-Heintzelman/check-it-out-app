  class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.integer :merchant_id
      t.string :item_description
      t.decimal :price, precision: 8, scale: 2
      t.timestamps null: false
    end
  end
end
