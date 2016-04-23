class Item < ActiveRecord::Base
  belongs_to :merchant
  has_many :orders
  has_many :bills, through: :orders

end
