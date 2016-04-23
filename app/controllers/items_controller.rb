class ItemsController < ApplicationController

  def index
    @items = Items.all(conditions: { merchant_id: params[:merchant_id]})
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    @merchant = Merchant.find(params[:item][:merchant_id])
    @item = Item.find(params[:id])
    @item.update(item_params)
    if @item.save
      redirect_to @merchant
    else
      @errors = @item.errors
      render edit
    end
  end

  def destroy
    @merchant = Merchant.find(params[:item][:merchant_id])
    @item = Item.find(params[:id])
    @item.destroy
    redirect_to @merchant
  end

  private
    def item_params
      params.require(:item).permit(:merchant_id, :item_description, :price)
    end
end
