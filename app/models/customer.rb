class Customer < ActiveRecord::Base
  validates_presence_of :username, :email, :password_digest
  validates_uniqueness_of :email, :username

  has_secure_password

  has_many :seatings
  has_many :transactions
  has_many :bills, through: :transactions

end
