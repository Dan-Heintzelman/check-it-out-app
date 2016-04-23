class SessionController < ApplicationController

  def index

  end

  def new

  end

  def create(user)
    @user = user.class.find_by(email: params[:session][:email])
    if @user && @user.authenticate(params[:session][:password])
      log_in @user
      redirect_to root_path
    else
      @errors = ["Invalid Credentials"]
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
