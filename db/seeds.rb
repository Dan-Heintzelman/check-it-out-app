Customer.destroy_all
Merchant.destroy_all
Seating.destroy_all
Item.destroy_all
Bill.destroy_all
Order.destroy_all
Transaction.destroy_all

mike = Customer.create!(first_name: "Mike", last_name: "Yao", email: "Mike@Yao.com", password: "password", username: "myao", financial_info: "Visa")

zach = Customer.create!(first_name: "Zach", last_name: "Barton", email: "Zach@Barton.com", password: "password", username: "zbarton", financial_info: "AMEX")

mcd = Merchant.create!(business_name: "McDonalds", username: "admin", password: "admin", financial_info: "Chase Bank")

hardrock = Merchant.create!(business_name: "Hard Rock Cafe", username: "hrcadmin", password: "admin", financial_info: "Bank of America")

seating1 = Seating.create!(customer: mike, merchant: mcd, bill_id: 1)
seating2 = Seating.create!(customer: zach, merchant: hardrock, bill_id: 2)

item1 = Item.create!(merchant: mcd, item_description: "beef", price: 3.50)
item2 = Item.create!(merchant: mcd, item_description: "mystery meat", price: 5.75)
item3 = Item.create!(merchant: hardrock, item_description: "nuggets", price: 6.05)
item4 = Item.create!(merchant: hardrock, item_description: "hard rocks", price: 4.00)

10.times do
  Item.create(merchant_id: Merchant.first.id, item_description: Faker::Commerce.product_name, price: Faker::Commerce.price)
end

2.times do
  Bill.create!
end

t1 = Transaction.create!(bill_id: 1, customer: mike)
t2 = Transaction.create!(bill_id: 2, customer: zach)

o1 = Order.create!(item: item1, bill_id: 1)
o2 = Order.create!(item: item2, bill_id: 1)
o3 = Order.create!(item: item3, bill_id: 2)
o4 = Order.create!(item: item4, bill_id: 2)
