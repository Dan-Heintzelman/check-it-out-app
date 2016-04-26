class Merchant < ActiveRecord::Base

  validates_presence_of :email, :business_name, :password_digest
  validates_uniqueness_of :email

  has_secure_password

  has_many :items
  has_many :seatings
  has_many :bills, through: :seatings
  has_many :customers, through: :seatings

  def checked_in
  array = []
  self.customers.each do |x|
    array << x.id
  end
  return array
  end

end
