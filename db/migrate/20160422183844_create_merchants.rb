class CreateMerchants < ActiveRecord::Migration
  def change
    create_table :merchants do |t|
      t.string :business_name, null: false
      t.string :email, null: false
      t.string :password_digest
      t.string :financial_info, null: false
      t.decimal :tax, default: 0.050, precision:4, scale: 4
      t.timestamps null: false
    end
  end
end
