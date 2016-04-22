class Customer < ActiveRecord::Base
  has_secure_password

  has_many :seatings
  has_many :transactions
  has_many :bills, through: :transactions

end
