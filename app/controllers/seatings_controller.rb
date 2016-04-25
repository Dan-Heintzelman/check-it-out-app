class SeatingsController < ApplicationController

  def index
    @merchant = Merchant.find(params[:merchant_id])
    @seatings = @merchant.seatings
  end

  def new
    @seating = Seating.new
  end

  def create
    @merchant = Merchant.find(params[:merchant_id])
    @seating = Seating.new(customer_id: 1)
    @merchant.seatings << @seating
    @seating.bill = Bill.new
    @customer = Customer.first
    if @seating.save
      render :json => { location: customer_path(@customer) }
    else
      render json: { location: new_merchant_seating_path, status: :unprocessable_entity}
    end
  end

  def show
    @merchant = Merchant.find(params[:merchant_id])
    @seating = Seating.find(params[:id])
    @customer = Customer.find(@seating.customer_id)
    respond_to do |format|
      format.html {}
      format.json {
        render json: {location: merchant_seating_path(@seating, @merchant)}
      }
    end
  end

  def update
    @merchant = Merchant.find(params[:merchant_id])
    @seating = Seating.find(params[:id])
    @customer = Customer.find(@seating.customer_id)
    if @seating.update(assigned: params[:assigned])
      redirect_to merchant_seating_path(@seating, @merchant)
    else
      flash[:danger] = "Failed to assign User"
      render show
    end
  end

  def destroy
    @seating = Seating.find(params[:id])
    @merchant = Merchant.find(params[:merchant_id])
    @seating.destroy
    redirect_to merchant_path(@merchant)
  end

  private
    def seating_params
      params.require(:seating).permit(:customer_id, :merchant_id, :assigned, :bill_id)
    end
end
