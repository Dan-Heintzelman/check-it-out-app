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
      if @merchant.save
        log_in_merchant(@merchant)
        redirect_to @merchant
      else
        errors = @merchant.errors.full_messages
        render 'new'
      end
    end

    def new
    end

    def edit
      @merchant = Merchant.find(params[:id])
    end

    def show
      @merchant = Merchant.find(params[:id])
      respond_to do |format|
        format.json { render json: { location: merchant_path(@merchant) }}
        format.html { }
      end
    end

    def update
      @merchant = Merchant.find(params[:id])
      @merchant.update(merchant_params)
      if @merchant.save
        redirect_to @merchant
      else
        @errors = @merchant.errors.full_messages
        render 'edit'
      end
    end


    private
      def merchant_params
        params.require(:merchant).permit(:business_name, :email, :password, :financial_info, :tax)
      end

      def log_in_merchant(merchant)
        session[:merchant_id] = merchant.id
      end
end
