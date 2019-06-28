class ItemsController < ApplicationController

  def index
    @items = Item.all
  end

  def show
    @merchant = Merchant.find(params[:id])
  end
end
