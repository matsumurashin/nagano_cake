class Public::ItemsController < ApplicationController
  def index
    @item = Item.all.page(params[:page]).per(10)
  end

  def show
    @item = Item.find(params[:id])
    @cart_item = CartItem.new
  end

  private

  def item_params
     params.require(:item).permit(:name, :introduction, :price, :image)
  end
end