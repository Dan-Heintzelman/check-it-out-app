class Transaction < ActiveRecord::Base
  belongs_to :bill
  belongs_to :customer
  validates_presence_of :customer_id
  validates_uniqueness_of :customer, scope: :bill
  has_many :orders

  def total
    if self.items.length > 0
      return self.items.reduce(0) { |sum, item| sum + item.price}
    else
      return 0
    end
  end
end

def orders_array
  self.orders
end

def merchant
  self.bill.merchant.business_name
end

