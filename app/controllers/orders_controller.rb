class OrdersController < ApplicationController

  def create
  end

  def show
  end

  def update
    @transaction = Transaction.find(params[:transaction_id])
    @order = Order.find(params[:id])
    @order.user_transaction = @transaction
    @order.save
  end

end
