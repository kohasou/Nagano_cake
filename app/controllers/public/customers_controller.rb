class Public::CustomersController < ApplicationController
  def show
    @customer = current_customer
  end

  def edit
    @customer = current_customer
  end

  def update
    if @customer.update
      redirect_to :show
    else
      render :edit
    end
  end
end
