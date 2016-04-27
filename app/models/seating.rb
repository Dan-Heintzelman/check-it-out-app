class Seating < ActiveRecord::Base
  validates_uniqueness_of :bill_id
  validates_uniqueness_of :customer_id, scope: :merchant
  belongs_to :customer
  belongs_to :merchant
  belongs_to :bill, dependent: :destroy

end
