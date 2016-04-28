require 'rails_helper'

RSpec.describe Bill, type: :model do

  pending "add some examples to (or delete) #{__FILE__}"

  describe "the paid? function" do
    let(:merchant) {Merchant.new(business_name: "Portillos", email: "email", password: "password", financial_info: "Money")}
    let(:customer) {Customer.new(first_name: "Ben", last_name: "Giamarino", email: "giaamriob@gmail.com", password: "12345")}
    let(:item1) {Item.new(merchant: merchant, item_description: "Cheesburger", price: 1.00)}
    let(:item2) {Item.new(merchant: merchant, item_description: "Cheesburger", price: 2.00)}
    let(:item3) {Item.new(merchant: merchant, item_description: "Cheesburger", price: 3.00)}
    let(:item4) {Item.new(merchant: merchant, item_description: "Cheesburger", price: 4.00)}
    let(:item5) {Item.new(merchant: merchant, item_description: "Cheesburger", price: 5.00)}
    let(:bill) {Bill.new(seating_id: 1)}
    let(:tran1) {Transaction.new(customer_id: customer, amount: 0.00)}
    let(:tran2) {Transaction.new(customer_id: customer, amount: 100.00)}
    let(:order1) {Order.new(item: item1, bill: bill)}
    let(:order2) {Order.new(item: item2, bill: bill)}
    let(:order3) {Order.new(item: item3, bill: bill)}
    let(:order4) {Order.new(item: item4, bill: bill)}
    let(:order5) {Order.new(item: item5, bill: bill)}
    let(:tran3) {Transaction.new(customer: customer, amount: 3.00)}
    let(:tran4) {Transaction.new(customer: customer, amount: 12.00)}



    it "is not paid if there are no items on the bill" do
      expect(bill.paid?).to be(false)
    end


    it "is not paid if the transaction amount is less than the bill total" do
      bill.items << item1
      tran1.orders << order1
      tran1.items << item1
      bill.transactions << tran1
      expect(bill.total/100).to eq(1.00)
      expect(bill.paid?).to be(false)
    end

    it "is not paid if all the items are not accounted for - even if the amount paid is above the total for the bill" do
      tran1.orders << order1 << order2
      tran1.items << item1 << item2
      tran2.orders << order3 << order4 << order5
      tran2.items << item3 << item4 << item5
      bill.items << item1 << item2 << item3 << item4 << item5
      bill.transactions << tran1 << tran2
      expect(bill.paid?).to be(false)
    end

    it "is paid if all the items are acounted for between all the transactions and the amount paid is equal to or larger than   the total and there is more than one element on the bill" do
      tran3.orders << order1 << order2
      tran3.items << item1 << item2
      tran4.orders << order3 << order4 << order5
      tran4.items << item3 << item4 << item5
      bill.items << item1 << item2 << item3 << item4 << item5
      bill.transactions << tran3 << tran4
      expect(bill.paid?).to be(true)
    end
  end
end
