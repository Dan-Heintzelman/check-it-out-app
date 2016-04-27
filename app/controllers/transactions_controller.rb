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
    charge = @customer.charge((params[:amount].to_f*100).to_i)
    @transaction = Transaction.find_by(bill: @bill, customer: @customer) if charge
    @transaction.amount += params[:amount].to_f
    if @transaction.save
      render json: { location: bill_path(@bill) }
    else
      status 422
    end
  end

  def destroy
    @bill = Bill.find(params[:bill_id])
    @transaction = Transaction.find(params[:id])
    if @transaction.customer_id != @bill.primary_customer
      @transaction.destroy
      render json: {}
    else
      render json: {}
    end
  end

end
