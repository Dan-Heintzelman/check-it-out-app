module SessionHelper

  def current_user
    if logged_in?
      @current_user = Customer.find(session[:merchant_id]) || @current_user = Merchant.find(session[:customer_id])
    end
  end

  def logged_in?
    session[:customer_id] || session[:merchant_id]
  end

end
