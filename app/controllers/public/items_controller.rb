class Public::ItemsController < ApplicationController
  def index
    @items = Item.page(params[:page])
  end

  def show
    @item = Item.find(params[:id])
    @cart_item = CartItem.new
  end

  def item_params
    params.require(:item).permit(:image, :item_name, :introduction, :non_taxed_price)
  end
end
