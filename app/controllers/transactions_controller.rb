class TransactionsController < ApplicationController

  def create
    @bill = Bill.find(params[:bill_id])
    @transaction = Transaction.new(customer_id: 1)
    @bill.transactions << @transaction
    if @transaction.save
      render json: {location: @transaction}
    else
      status 422
    end
  end

  def show
    @transaction = Transaction.find(params[:id])
    render :json => {location: @transaction}
  end

  def update
    @bill = Bill.find(params[:bill_id])
    @transaction = Transaction.find(params[:id])
    @transaction.update(trans_params)
    if @transaction.save
      render json: => { location: @bill }
    else
      status 422
    end
  end

  private
    def trans_params
      params.require(:transaction).permit(:bill_id, :customer_id, :amount)
    end
end
