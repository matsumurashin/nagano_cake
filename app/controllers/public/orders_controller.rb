class Public::OrdersController < ApplicationController
  def new
  end

  def complete
  end

  def idex
  end

  def show
  end

  private

  def order_params
    params.require(:order).permit(:status, :name, :postal_code, :address, :shipping_fee, :amount_billed)
  end
end
