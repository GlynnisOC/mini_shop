class ItemsController < ApplicationController

  def index
    if params[:merchant_id] == nil
      @items = Item.all
    else
      @merchant = Merchant.find(params[:merchant_id])
      @items = @merchant.items
    end
  end

  def new
    @merchant_id = params[:merchant_id]
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])
    @item.update!(item_params)
    redirect_to "/items/#{@item.id}"
  end

  def create
    @merchant = Merchant.find(params[:merchant_id])
    @item = @merchant.items.create!(item_params)
    redirect_to "/merchants/#{@merchant.id}/items"
  end

  def show
    @item = Item.find(params[:id])
  end

  private

  def item_params
    params.permit(:name, :description, :price, :image, :inventory)
  end
end
