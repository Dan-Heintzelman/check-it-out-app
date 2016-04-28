class Transaction < ActiveRecord::Base
  belongs_to :bill
  belongs_to :customer
  validates_presence_of :customer_id
  validates_uniqueness_of :customer, scope: :bill
  has_many :orders
  has_many :items, through: :orders

  def total
    if self.items.length > 0
      return self.items.reduce(0) { |sum, item| sum + item.price_to_cents}
    else
      return 0
    end
  end

  def items_array
    self.items
  end

  def merchant_name
    self.bill.merchant.business_name
  end
end
