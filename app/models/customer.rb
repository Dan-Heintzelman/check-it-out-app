class Customer < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  validates_presence_of :email
  validates_uniqueness_of :email

  has_many :seatings
  has_many :transactions
  has_many :bills, through: :transactions
  has_many :items, through: :transactions


  def charge(amount)
    return nil unless self.stripe_customer_id

    Stripe::Charge.create(
          :customer    => self.stripe_customer_id,
          :amount      => amount,
          :description => 'Rails Stripe customer',
          :currency    => 'usd'
        )
    end
end
