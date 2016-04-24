class SessionsController < ApplicationController

  def index

  end

  def new
  end

  def create
    respond_to do |format|
      format.html {
        @merchant = Merchant.find_by(username: params[:session][:username])
        if @merchant && @merchant.authenticate(params[:session][:password])
          log_in_merchant(@merchant)
          redirect_to @merchant
        else
          @errors = ["Invalid Credentials"]
          render new
        end
      }
      format.json {
        @customer = Customer.find_by(username: params[:session][:username])
        if @customer && @customer.authenticate(params[:session][:password])
          log_in_customer(@customer)
          render json: @customer
        else
          render json: { errors: ["Invalid Credentials"]}, status: :unauthorized
        end
      }
    end
  end

  def destroy
    respond_to do |format|
      format.html {
        log_out_merchant
        redirect_to root_url
      }
      format.json {
        log_out_customer
        dredirect_to root_url
      }
  end

  def log_in_merchant(merchant)
    session[:merchant_id] = merchant.id
  end

  def log_in_customer(customer)
    session[:customer_id] = customer.id
  end

  def log_out_merchant
    session.delete(:merchant_id)
  end

  def log_out_customer
    session.delete(:customer_id)
  end
end
