class Bill < ActiveRecord::Base
  has_one :seating
  has_many :orders
  has_many :transactions
  has_many :customers, through: :transactions
  has_many :merchants, through: :seatings
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

