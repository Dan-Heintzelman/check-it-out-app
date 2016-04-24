class Transaction < ActiveRecord::Base
  belongs_to :bill
  belongs_to :customer
  has_many :items, through: :bill

  def total
    if self.items.length > 0
      return self.items.reduce(0) { |sum, item| sum + item.price}
    else
      return 0
    end
  end
end
