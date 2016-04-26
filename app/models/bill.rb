class Bill < ActiveRecord::Base
  has_one :seating
  has_many :orders
  has_many :transactions
  has_one :customer, through: :seating
  has_many :payers, through: :transactions, source: :customer
  has_one :merchant, through: :seating
  has_many :items, through: :orders

  def total
    total = 0
    self.items.each do |item|
      price = item.price_to_cents
      total += price # returns total in number of cents
    end
    return total
  end

  def merchant_name
    self.merchant.business_name if self.merchant
  end

  def seating_id
    self.seating.id if self.seating
  end

  def paid?
    total == transactions{ |sum, n| sum + n.amount }
  end

  def item_array
    array = []
    self.orders.each do |order|
      assigned = ""
      assigned = order.user_transaction.customer.first_name if order.user_transaction
      array << {:item_description => order.item.item_description,:price => order.item.price,:id =>order.id,:assigned_to => assigned}
    end
    p array

  end


  def transaction_array
    array = []
    self.transactions.each do |transaction|
      sum = 0
      transaction.orders.each{|x| sum+=x.item.price if x.item}
      array << [transaction.customer.first_name, transaction.amount, transaction.id, sum]
    end
    return array

  end


end

