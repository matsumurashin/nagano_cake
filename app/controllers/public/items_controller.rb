class Public::ItemsController < ApplicationController
  def index
    @item = Item.page(params[:page])
  end

  def show
  end
end
