class FlowerShopFlowersController < ApplicationController
  def index
    @flowers = Flower.where(flower_shop_id: params[:id])
  end
end
