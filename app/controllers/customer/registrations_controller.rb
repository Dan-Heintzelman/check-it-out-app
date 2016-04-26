class Customer::RegistrationsController < Devise::RegistrationsController
  respond_to :json, :html
  before_filter :check_params, :configure_permitted_parameters

  def check_params
    puts params
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :email, :password])
  end

end
