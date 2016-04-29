require 'faker'

Customer.destroy_all
Merchant.destroy_all
Seating.destroy_all
Item.destroy_all
Bill.destroy_all
Order.destroy_all
Transaction.destroy_all

# mike = Customer.create!(first_name: "Mike", last_name: "Yao", email: "Mike@Yao.com", password: "password", financial_info: "VISA")

# zach = Customer.create!(first_name: "Zach", last_name: "Barton", email: "Zach@Barton.com", password: "password", financial_info: "AMEX")

# ben = Customer.create!(first_name: "Ben", last_name: "Giamarino", email: "ben@gmail.com", password: "password", financial_info: "VISA")

# dan = Customer.create!(first_name: "Dan", last_name: "TheMan", email: "dan@heintz.com", password: "password", financial_info: "VISA")

lm = Merchant.create!(business_name: "Illuminati's Deep-Dish Pizza", email: "lmadmin", password: "admin", financial_info: "Bank of America")

tv = Merchant.create!(business_name: "Tres Verdes", email: "tvadmin", password: "admin", financial_info: "Bank of America")

pc = Merchant.create!(business_name: "Pepper Lannister", email: "pladmin", password: "admin", financial_info: "Bank of America")

rd = Merchant.create!(business_name: "Ramen Dogedata", email: "rdadmin", password: "admin", financial_info: "Bank of America")

mcd = Merchant.create!(business_name: "McDanald's", email: "mcdadmin", password: "admin", financial_info: "Bank of America")

# seating1 = Seating.create!(customer: mike, merchant: rd, bill_id: 1)
# seating2 = Seating.create!(customer: zach, merchant: tv, bill_id: 2)

item1 = Item.create!(merchant: rd, item_description: "Tonkatsu", price: 14.00)
item2 = Item.create!(merchant: rd, item_description: "Chicken Paitan", price: 12.00)
item3 = Item.create!(merchant: rd, item_description: "Maruchan", price: 0.99)
item4 = Item.create!(merchant: rd, item_description: "Thousand-Year-Egg Ramen", price: 100.00)
item5 = Item.create!(merchant: lm, item_description: "Pepperoni Pizza", price: 15.11)
item6 = Item.create!(merchant: lm, item_description: "Cheese Pizza", price: 16.11)
item7 = Item.create!(merchant: lm, item_description: "Lasagna", price: 9.77)
item8 = Item.create!(merchant: tv, item_description: "Small Cheval Cheeseburger", price: 13.43)
item9 = Item.create!(merchant: tv, item_description: "Fries", price: 4.22)
item10 = Item.create!(merchant: tv, item_description: "Overpriced Salad", price: 18.66)
item11 = Item.create!(merchant: tv, item_description: "Cocktail", price: 8.00)
item12 = Item.create!(merchant: pc, item_description: "Tater Tots", price: 7.07)
item13 = Item.create!(merchant: pc, item_description: "Quesadilla", price: 9.09)
item14 = Item.create!(merchant: pc, item_description: "Mediocre Tuna Melt", price: 4.11)
item15 = Item.create!(merchant: pc, item_description: "Beer", price: 5.88)
item16 = Item.create!(merchant: mcd, item_description: "Mountain Climbin' Mountain Dew", price: 4.11)
item17 = Item.create!(merchant: mcd, item_description: "Big Dan Patty Melt", price: 5.88)

10.times do
  Item.create(merchant_id: Merchant.first.id, item_description: Faker::Commerce.product_name, price: Faker::Commerce.price)
end


# seating1.bill = Bill.create!
# seating2.bill = Bill.create!


# t1 = Transaction.create!(bill_id: 1, customer: mike)
# t2 = Transaction.create!(bill_id: 2, customer: zach)

# o1 = Order.create!(item: item1, bill_id: 1)
# o2 = Order.create!(item: item2, bill_id: 1)
# o3 = Order.create!(item: item3, bill_id: 2)
# o4 = Order.create!(item: item4, bill_id: 2)
