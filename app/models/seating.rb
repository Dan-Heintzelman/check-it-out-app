class Seating < ActiveRecord::Base
  belongs_to :customer
  belongs_to :merchant
  belongs_to :bill

end
