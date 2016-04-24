class BillsController < ApplicationController

  def index
    @bills = Bill.all
  end

  def new
    @bill = Bill.new()
    @merchant = Merchant.find(session[:merchant_id])
    @seating = Seating.find(params[:seating])
  end

  def create
    @bill = Bill.new
    @bill.save
    # get ITEM ID from parameter json
    # build association between Bill ID and Item ID for orders table
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
