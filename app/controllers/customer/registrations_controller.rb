class Customer::RegistrationsController < Devise::RegistrationsController
  respond_to :json, :html
  # before_filter :check_params
  #
  # def check_params
  #   p params
  # end
  #
  # def create
  #   @customer = Customer.new(params[:customer])
  #   if @customer.save
  #     # sign_in(:customer, @customer)
  #     puts "yay"
  #     # render json: {location: customer_path(@customer)}
  #   else
  #     puts "nay"
  #     # @errors = @customer.errors.full_messages
  #     # render json: {location: new_customer_path, status: :unprocessable_entity }
  #   end
  # end
  #
  # private
  #   def customer_params
  #     params.require(:customer).permit(:first_name, :last_name, :password, :email)
  #   end

end
