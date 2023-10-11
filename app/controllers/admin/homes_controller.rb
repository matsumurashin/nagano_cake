class Admin::HomesController < ApplicationController
  def top
    @order = Order.all.page(params[:page]).per(10)
    @amount = 0
  end
end
