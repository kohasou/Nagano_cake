class Admin::HomesController < ApplicationController
  def top
    @orders = Order.all
    @total_quantity = 0
  end
end
