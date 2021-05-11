class FlowerShopController < ApplicationController
  def index
    @flower_shop = FlowerShop.all
  end
end
