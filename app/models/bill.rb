class Bill < ActiveRecord::Base
  has_one :seating
  has_many :orders
  has_many :transactions
  has_many :customers, through: :transactions
  has_many :merchants, through: :seatings
  has_many :items, through: :orders
end
