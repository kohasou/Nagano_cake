class Public::CustomersController < ApplicationController
  def show
    @customer = current_customer
  end

  def edit
    @customer = current_customer
  end

  def withdrawal
  end

  def deleteprocess
    current_customer.update(is_active: false)
    reset_session
    redirect_to root_path
  end

  def update
    if current_customer.update(customer_params)
      redirect_to my_page_path
    else
      render :edit
    end
  end

  private

  def customer_params
    params.require(:customer).permit(:last_name, :first_name, :last_name_kana, :first_name_kana,
    :postal_code, :address, :telephone_number, :email,)
  end
end
