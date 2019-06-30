class ItemsController < ApplicationController

  def index
    @items = Item.all
  end

  def show
    @item = Item.find(params[:id])
  end

  private

  def item_params
    params.require(:merchant).permit(:name, :description, :price, :image, :active, :inventory)
  end
end
