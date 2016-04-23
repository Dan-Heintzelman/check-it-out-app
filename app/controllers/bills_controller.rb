class BillsController < ApplicationController

  def index
    @bills = Bill.all
  end

  def new
    #temporary merchant assignment to check bill creation
    #merchant ID should come from the session when a merchant is logged in
    @merchant = Merchant.first

    @bill = Bill.new
  end

  def create
  end

  def show
    @bill = Bill.find(params[:id])
  end

  def edit
    @bill = Bill.find(params[:id])
  end

  def update
  end


end
