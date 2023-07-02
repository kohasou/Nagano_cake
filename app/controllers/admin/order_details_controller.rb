class Admin::OrderDetailsController < ApplicationController
  before_action :authenticate_admin!
  def show
    @order = Order.find(params[:id])
    @total_price = 0
  end

  private

  def order_detail_params
  params.require(:order_detail).permit(:order_id, :item_id, :ordering_price, :item_quantity)
  end
end
