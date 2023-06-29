class Admin::OrderDetailsController < ApplicationController
  def show
    @order = Order.find(params[:id])
  end

  private

  def order_detail_params
  params.require(:order_detail).permit(:order_id, :item_id, :ordering_price, :item_quantity)
  end
end
