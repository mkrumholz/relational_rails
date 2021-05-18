class FlowerShopFlowersController < FlowersController
  def index
    @flowers = Flower.where(flower_shop_id: params[:id])
    @flower_shop = FlowerShop.find(params[:id])
  end

  def new
    @flower_shop = FlowerShop.find(params[:id])
  end

  def create
    flower_shop = FlowerShop.find(params[:id])
    @flowers = flower_shop.flowers.create(flower_params)
    redirect_to "/flower_shops/#{flower_shop.id}/flowers"
  end
end
