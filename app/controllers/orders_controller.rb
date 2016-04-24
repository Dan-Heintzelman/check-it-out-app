class OrdersController < ApplicationController

  def destroy
    @order = Order.find_by(item_id: params[:id], bill_id: params[:bill_id])
    @order.destroy
    @bill = Bill.find(params[:bill_id])
    render :html => {location: @bill}
  end

end
