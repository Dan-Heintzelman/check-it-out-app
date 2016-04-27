class Item < ActiveRecord::Base
  belongs_to :merchant
  has_many :orders
  has_many :bills, through: :orders
  before_save :price_to_cents

  def price_to_cents
    self.int_price = (self.price * 100).to_i
  end

end
