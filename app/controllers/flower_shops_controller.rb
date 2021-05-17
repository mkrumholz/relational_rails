class FlowerShopsController < ApplicationController
  def index
    @flower_shops = FlowerShop.order(created_at: :desc)
  end

  def show
    @flower_shop = FlowerShop.find(params[:id])
  end
end
