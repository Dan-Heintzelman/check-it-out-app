class Order < ActiveRecord::Base
  belongs_to :item
  belongs_to :bill
  belongs_to :user_transaction, class_name: :Transaction, foreign_key: :transaction_id
end
