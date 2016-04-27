class TransactionsController < ApplicationController

  def create
    @bill = Bill.find(params[:bill_id])
    @customer = Customer.find_by(email: params[:email])
    @transaction = Transaction.new(bill: @bill, customer: @customer)
    if @transaction.save
      @bill.transactions << @transaction
      puts "I SAVED OH NO!"
      render json: {location: @transaction}
    else
      puts 'OKAY WELL AT LEAST IM NOT SAVING!'
      render :json => @customer, :status => 404
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
      render json: { }
    else
      render json: {status: :not_found}
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
