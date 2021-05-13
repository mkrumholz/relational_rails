class FlowerShopsController < ApplicationController
  def index
    @flower_shops = FlowerShop.all
  end

  def show
    @flower_shops = FlowerShop.find(params[:id])
  end
end
