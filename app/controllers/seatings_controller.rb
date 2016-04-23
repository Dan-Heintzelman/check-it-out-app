class SeatingsController < ApplicationController

  def index
    @seatings = Seating.all
  end


end
