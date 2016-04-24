class SeatingsController < ApplicationController

  def index
    @seatings = Seating.all
  end

  def new
    @seating = Seating.new
  end

  def create
    @seating = Seating.new
    if @seating.save
      @bill = Bill.new
      @seating.bill_id = @bill.id
    else
      #your shit failed
    end
  end

  def show
    @seating = Seating.find_by()
  end
end
