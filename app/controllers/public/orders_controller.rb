class Public::OrdersController < ApplicationController
  def new
    @order = Order.new
    @customer = current_customer
    @cart_item = current_customer.cart_items.all
    if @cart_item.present?

    else
      redirect_to items_path
    end
  end

  def index
    @total_price = 0
    @orders = Order.all
  end

  def show
    @order = Order.find(params[:id])
    @total_price = 0
  end

  def confirmation
    @order = current_customer.orders.build(order_params)
    @total = current_customer.cart_items.inject(0) { |sum, item| sum + item.sum_of_price }
    if params.dig(:order, :address) == "0"
      @order.delivery_postal_code = current_customer.postal_code
      @order.delivery_address = current_customer.address
      @order.delivery_name = "#{current_customer.last_name} #{current_customer.first_name}"
    else
      @order.delivery_name = "#{params.dig(:order, :last_name)} #{params.dig(:order, :first_name)}"
    end
  end

  def create
    cart_items = current_customer.cart_items.all
    @order = Order.new(order_params)
    if @order.save
      cart_items.each do |cart|
        order_detail = OrderDetail.new
        order_detail.item_id = cart.item_id
        order_detail.order_id = @order.id
        order_detail.item_quantity = cart.quantity
        order_detail.ordering_price = cart.item.with_tax_price * order_detail.item_quantity
        order_detail.save
       end
      redirect_to  completion_path
      cart_items.destroy_all
    else
      @order = Order.new(order_params)
      render :new
    end
  end

  private

  def order_params
    params.require(:order).permit(:payment_method, :delivery_postal_code, :delivery_address, :delivery_name, :customer_id, :billing_amount, :postage, :created_at)
  end
end
