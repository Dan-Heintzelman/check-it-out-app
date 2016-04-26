class ChargesController < ApplicationController
  before_filter :check_params
  def new
  end

  def check_params
    puts params
  end

  def create
    # Amount in cents
    @amount = params[:charge_ammount]
    current_customer.charge(@ammount);

    rescue Stripe::CardError => e
      flash[:error] = e.message
      redirect_to new_charge_path
  end
end
