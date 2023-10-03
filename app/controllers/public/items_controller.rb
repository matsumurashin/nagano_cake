class Public::ItemsController < ApplicationController
  def index
    @item = Item.page(params[:page])
  end

  def show
    @cart_item = CartItem.new
    @item = Item.find(params[:id])
  end

  private

  def item_params
     params.require(:item).permit(:name, :introduction, :price, :image)
  end
end