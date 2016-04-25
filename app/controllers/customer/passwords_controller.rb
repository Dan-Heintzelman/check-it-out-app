class Customer::PasswordsController < Devise::PasswordsController
  respond_to :json, :html
end
