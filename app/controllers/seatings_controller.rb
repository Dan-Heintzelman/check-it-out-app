class SeatingsController < ApplicationController

  def index
    @seatings = Seating.where(merchant_id: params[:merchant_id])
    puts @seatings
  end

  def new
    @seating = Seating.new
  end

  def create
    @seating = Seating.new
    if @seating.save
      puts "NEW SEAT"
    else
      #your shit failed
    end
  end

  def show
    @seating = Seating.find_by()
  end
end
