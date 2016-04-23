class SessionsController < ApplicationController

  def index

  end

  def new
  end

  def create
    responds_to do |format|
      format.xml {
        @merchant = Merchant.find_by(username: params[:session][:username])
        if @merchant && @merchant.authenticate(params[:session][:password])
          log_in @merchant
          redirect_to @merchant
        else
          @errors = ["Invalid Credentials"]
          render new
        end
      }
    end
  end

  def destroy
    log_out
    redirect_to root_url
  end

  def log_in(user)
    session[:user_id] = user.id
  end

  def log_out
    session.delete(:user_id)
  end
end
