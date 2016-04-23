class Item < ActiveRecord::Base
  belongs_to :merchant
  has_many :orders
  has_many :bills, through: :orders

  def price_to_cents
    converted_price = (self.price * 100).to_i
  end

end
