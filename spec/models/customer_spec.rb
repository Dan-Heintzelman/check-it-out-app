require 'rails_helper'

RSpec.describe Customer, type: :model do
  let :user = Customer.new(first_name: "Zach", last_name: "Barton", email: "Zach@Barton.com", password: "password", username: "zbarton", financial_info: "AMEX")

end
