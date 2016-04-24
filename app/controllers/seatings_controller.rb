class SeatingsController < ApplicationController

  def index
    @seatings = Seating.where(merchant_id: params[:merchant_id])
    puts @seatings
  end

  def new
    @seating = Seating.new
  end

  def create
    @merchant = Merchant.find(params[:merchant_id])
    @seating = Seating.new(customer_id: 1)
    @merchant.seatings << @seating
    @seating.bill = Bill.new
    @customer = Customer.first
    if @seating.save
      render :json => { location: @customer }
    else
      status 422
    end
  end

  def show
    @seating = Seating.find_by()
  end
end
