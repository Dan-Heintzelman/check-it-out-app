class CreateMerchants < ActiveRecord::Migration
  def change
    create_table :merchants do |t|
      t.string :business_name
      t.string :username
      t.string :password_digest
      t.string :financial_info
      t.timestamps null: false
    end
  end
end
