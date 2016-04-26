class Customer::RegistrationsController < Devise::RegistrationsController
  respond_to :json, :html
  before_filter :check_params,:configure_permitted_parameters

  def check_params
    puts params
  end

  protected

  def configure_permitted_parameters
    #Collects wrapped stripe token info
    puts stripe_customer_info = params[:customer][:stripe_customer_id]

    stripe_customer = Stripe::Customer.create(
      :email => stripe_customer_info[:email],
      :source  => stripe_customer_info[:token]
    )
    #overwrites params with newly created stripe customer ID
    params[:customer][:stripe_customer_id] = stripe_customer.id

    devise_parameter_sanitizer.permit(:sign_up) do |customer|
      customer.permit(:first_name, :last_name, :password, :email, :stripe_customer_id)
    end

  end

end

#Add customer with token
