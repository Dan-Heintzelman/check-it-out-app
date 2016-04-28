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
    let(:tran1) {Transaction.new(bill: bill, customer_id: customer, amount: 0.00)}
    let(:tran2) {Transaction.new(bill: bill, customer_id: customer, amount: 100.00)}
    let(:order1) {Order.new(item: item1, bill: bill, transaction: tran1)}
    let(:order2) {Order.new(item: item2, bill: bill, transaction: tran1)}
    let(:order3) {Order.new(item: item3, bill: bill, transaction: tran1)}
    let(:order4) {Order.new(item: item4, bill: bill, transaction: tran1)}
    let(:order5) {Order.new(item: item5, bill: bill, transaction: tran1)}



    it "is not paid if there are no items on the bill" do
      expect(bill.paid?).to be(false)
    end

    it "is not paid if the transaction amount is less than the bill total" do
      bill.transactions << tran1
      bill.orders << order1
      expect(bill.paid?).to be(false)
    end
  end
end
