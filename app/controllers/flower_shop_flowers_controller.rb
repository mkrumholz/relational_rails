class FlowerShopFlowersController < FlowersController
  def index
    @flower_shop = FlowerShop.find(params[:id])
    return @flowers = @flower_shop.flowers_by_name if params[:sort] == 'by_species'
    @flowers = @flower_shop.flowers
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
