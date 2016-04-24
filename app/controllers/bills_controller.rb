class BillsController < ApplicationController

  def index
    @bills = Bill.all
  end

  def new
    @bill = Bill.new
    @merchant = Merchant.find(session[:merchant_id])
    @seating = Seating.find(params[:seating])
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
    @bill = Bill.find(params[:id])
    params.except(:action, :controller, :id).each do |param|
      item_id = param[1]["item_id"].to_i
      new_item = Item.find(item_id)
      @bill.items << new_item
    end
    @bill.save
    if request.xhr?
      render :json => {:location => merchant_seatings_path(@bill.merchant.id)}
    else
      redirect_to merchant_seatings_path(@bill.merchant.id)
    end
  end


end
