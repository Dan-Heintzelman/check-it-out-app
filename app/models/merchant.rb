class Merchant < ActiveRecord::Base

  has_secure_password

  has_many :items
  has_many :seatings
  has_many :bills, through: :seatings
  has_many :customers, through: :seatings
end
