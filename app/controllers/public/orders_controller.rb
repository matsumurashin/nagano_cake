class Public::OrdersController < ApplicationController
  def new
    @order = Order.new
  end

  def confirm
    @order = Order.new(order_params)
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
