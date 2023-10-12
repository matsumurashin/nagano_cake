class Public::OrdersController < ApplicationController
  def new
    @order = Order.new
    @customer = current_customer
  end

  def confirm
    @order = current_customer.orders.new(order_params)
    @order.postal_code = current_customer.postal_code
    @order.address = current_customer.address
    @order.name = current_customer.first_name + current_customer.last_name
    @cart_items = current_customer.cart_items
    @order.shipping_fee = 800
    @total = 0
  end

  def create
    @order = current_customer.orders.new(order_params)
    @cart_items = current_customer.cart_items
    @order.shipping_fee = 800
    if @order.save
      @cart_items.each do |cart_item|
        @order_detail = OrderDetail.new
        @order_detail.order_id = @order.id
        @order_detail.item_id = cart_item.item_id
        @order_detail.price = (cart_item.item.price * 1.1 * cart_item.amount).to_i
        @order_detail.amount = cart_item.amount
        @order_detail.save
      end
      @cart_items.destroy_all
    end
    redirect_to orders_complete_path
  end

  def complete
  end

  def index
    @order = current_customer.orders.all
  end

  def show
  end

  private

  def order_params
    params.require(:order).permit(:payment_method, :name, :postal_code, :address, :shipping_fee, :amount_billed)
  end
end
