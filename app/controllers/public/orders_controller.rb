class Public::OrdersController < ApplicationController
  def new
    @order = Order.new
    @customer = current_customer
  end

  def confirmation
    @order = current_customer.orders.build(order_params)
    if params.dig(:order, :address) == "0"
      @order.delivery_postal_code = current_customer.postal_code
      @order.delivery_address = current_customer.address
      @order.delivery_name = "#{current_customer.last_name} #{current_customer.first_name}"
    else
      @order.delivery_name = "#{params.dig(:order, :last_name)} #{params.dig(:order, :first_name)}"
    end
  end

  private

  def order_params
    params.require(:order).permit(:payment_method, :delivery_postal_code, :delivery_address)
  end
end
