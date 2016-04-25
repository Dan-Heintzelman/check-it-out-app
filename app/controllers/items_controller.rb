class ItemsController < ApplicationController

  def index
    @merchant = Merchant.find(params[:merchant_id])
    @items = @merchant.items
  end

  def new
    @merchant = Merchant.find(params[:merchant_id])
  end

  def create
    @merchant = Merchant.find(params[:merchant_id])
    @item = Item.new(item_params)
    if @item.save
      @merchant.items << @item
      redirect_to merchant_items_path(@merchant)
    else
      @errors = @item.errors.full_messages
      render 'new'
    end
  end

  def edit
    @merchant = Merchant.find(params[:merchant_id])
    @item = Item.find(params[:id])
  end

  def update
    @merchant = Merchant.find(params[:merchant_id])
    @item = Item.find(params[:id])
    @item.update(item_params)
    if @item.save
      redirect_to merchant_items_path(@merchant)
    else
      @errors = @item.errors
      render 'edit'
    end
  end

  def destroy
    @merchant = Merchant.find(params[:merchant_id])
    @item = Item.find(params[:id])
    @item.destroy
    redirect_to merchant_items_path(@merchant)
  end

  private
    def item_params
      params.require(:item).permit(:merchant_id, :item_description, :price)
    end
end
