class Admin::OrdersController < ApplicationController
  def show
    @order = Order.find(params[:id])
    @order_detail = OrderDetail.find(params[:id])
  end

  private

  def order_params
    params.require(:order).parmit(:name, :postal_cade, :address)
  end
end
