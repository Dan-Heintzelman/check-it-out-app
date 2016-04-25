class Seating < ActiveRecord::Base
  validates_uniqueness_of :bill_id
  belongs_to :customer
  belongs_to :merchant
  has_one :bill, dependent: :destroy

end
