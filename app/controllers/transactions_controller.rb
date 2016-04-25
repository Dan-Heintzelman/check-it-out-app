class TransactionsController < ApplicationController

  def create
    @bill = Bill.find(params[:bill_id])
    @customer = Customer.find_by(email: params[:email])
    @transaction = Transaction.new(bill: @bill, customer: @customer)
    if @transaction.save
      @bill.transactions << @transaction
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
    p params
    @bill = Bill.find(params[:bill_id])
    @customer = Customer.find(params[:user_id])
    @transaction = Transaction.find_by(bill: @bill, customer: @customer)
    @transaction.amount += params[:amount].to_f
    if @transaction.save
      render json: { location: bill_path(@bill) }
    else
      status 422
    end
  end

end
