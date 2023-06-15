class Public::CartItemsController < ApplicationController

  def index
    @cart_item = current_customer.cart_items
  end

  def show
    @item = Item.find(params[:id])
    @cart_item = CartItem.new
  end

  def create
    @cart_item = CartItem.new(cart_item_params)
    @cart_item.customer_id = current_customer.id
    @cart_item.save
    redirect_to cart_items_path
  end

  private

  def cart_item_params
    params.require(:cart_item).permit(:item_id, :quantity)
  end
end
