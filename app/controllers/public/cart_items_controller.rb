class Public::CartItemsController < ApplicationController
  def index
    @cart_item = CartItem.all
    @total = 0
  end

  def create
    @cart_items = current_customer.cart_items
    if cart_item = @cart_items.find_by(item_id:params[:cart_item][:item_id])
      cart_item.update(amount: cart_item.amount + params[:cart_item][:amount].to_i)
    else
      @cart_item = CartItem.new(cart_item_params)
      @cart_item.customer_id = current_customer.id
      @cart_item.save
    end
    redirect_to cart_items_path
  end

  def update
    @cart_item = CartItem.find(params[:id])
    @cart_item.update(cart_item_params)
    redirect_to cart_items_path
  end

  def destroy_all
    @cart_items = current_customer.cart_items
    @cart_items.each do |cart_item|
    cart_item.destroy
    end
    redirect_to cart_items_path
  end

  def destroy
    @cart_item = CartItem.find(params[:id])
    @cart_item.destroy
    redirect_to cart_items_path
  end

  private

  def cart_item_params
    params.require(:cart_item).permit(:item_id, :amount, :image)
  end
end
