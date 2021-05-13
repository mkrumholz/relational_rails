class FlowerShopsController < ApplicationController
  def index
    @flower_shops = FlowerShop.all
  end

  def show
  end
end
