class MerchantsController < ApplicationController
    def index
      @merchants = Merchant.all
      respond_to do |format|
        format.html { }
        format.json { } # DISCUSS WITH BEN
      end
    end

    def create
      @merchant = Merchant.new(merchant_params)
    end

    def new
      @merchant = Merchant.new
    end

    def edit
      @merchant = Merchant.find(params[:id])
      @merchant.update(merchant_params)
      if @merchant.save
        redirect_to @merchant
      else
        @errors = @merchant.errors
        render edit
      end
    end



    def show
      @merchant = Merchant.find(params[:id])
      respond_to do |format|
        format.json { render json: { location: merchant_path(@merchant) }}
        format.html { }
      end

    end


    private
      def merchant_params
        params.require(:merchant).permit(:business_name, :username, :password, :financial_info)
      end
end
