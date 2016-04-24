class Bill < ActiveRecord::Base
  has_one :seating
  has_many :orders
  has_many :transactions
  has_one :customer, through: :seating
  has_many :payers, through: :transactions, source: :customer
  has_one :merchant, through: :seating
  has_many :items, through: :orders

  def total
    total = 0
    self.items.each do |item|
      price = item.converted_price
      total += price # returns total in number of cents
    end
    return total
  end




end

