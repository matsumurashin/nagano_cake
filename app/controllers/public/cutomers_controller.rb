class Public::CutomersController < ApplicationController
  def show
    @customer = Customer.find(current_customer.id)
  end

  def edit
  end

  def check
  end

  def customer_params
    params.require(:customer).permit(:first_name, :last_name, :first_name_kana, :last_name_kana, :postal_code, :address, :telephone_number, :is_deleted)
  end

end
