class Admin::OrdersController < ApplicationController
  def show
    @order = Order.find(params[:id])
    @total = 0
    @order.shipping_fee = 800
  end

  private

  def order_params
    params.require(:order).parmit(:name, :postal_cade, :address)
  end
end
