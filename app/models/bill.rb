class Bill < ActiveRecord::Base
  has_one :seating
  has_many :orders
  has_many :transactions
  has_many :customers, through: :transactions
  has_one :merchant, through: :seating
  has_many :items, through: :orders

  def total
    total = 0
    self.items.each do |item|
      price = item.price_to_cents
      total += price # returns total in number of cents
    end
    return total
  end




end

