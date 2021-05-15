class FlowerShopsController < ApplicationController
  def index
    @flower_shops = FlowerShop.all
  end

  def show
    @flower_shop = FlowerShop.find(params[:id])
  end
end
