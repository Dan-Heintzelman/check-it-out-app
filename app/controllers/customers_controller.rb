class CustomersController < ApplicationController

  before_action :authenticate_customer!, only: [:show, :edit, :update, :destroy]
  def index
    @customers = Customer.all

  end

  def new
    #display a form that passes customer params to the create route
  end

  def create
    @customer = Customer.new(params[:customer])
    if @customer.save
      session[:user_id] = @customer.id
      redirect_to @customer
    else
      @errors = @customer.errors.full_messages
      render :new
    end
  end

  def show
    @customer = Customer.find(params[:id])
  end

  def edit
    @customer = Customer.find(params[:id])
  end

  def update
    @customer = Customer.find(params[:id])
    if @customer.update(customer_params)
      redirect_to @user, notice: 'Your profile has been updated!' #profile view,
    else
      render :edit
    end
  end

  def destroy
    @customer = Customer.find(params[:id])
    @customer.destroy
  end

  private
    def customer_params
      params.require(:customer).permit(:first_name, :last_name, :password, :email, :username)
    end

end

