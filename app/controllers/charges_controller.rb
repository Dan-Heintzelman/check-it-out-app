class ChargesController < ApplicationController
  before_filter :check_params
  def new
  end

  def check_params
    puts params
  end

  def create
    # Amount in cents
    customer = Customer.find(params[:customer_id])
    amount = params[:charge_amount]
    customer.charge(amount);

    rescue Stripe::CardError => e
      flash[:error] = e.message
      redirect_to new_charge_path
  end
end
