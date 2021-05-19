class FlowerShopFlowersController < FlowersController
  def index
    @flower_shop = FlowerShop.find(params[:id])
    flowers = sort_order(params)
    @flowers = min_shelf_life(flowers, params)
  end

  def new
    @flower_shop = FlowerShop.find(params[:id])
  end

  def create
    flower_shop = FlowerShop.find(params[:id])
    @flowers = flower_shop.flowers.create(flower_params)
    redirect_to "/flower_shops/#{flower_shop.id}/flowers"
  end

  private
    def sort_order(params)
      return @flower_shop.flowers_by_name if params[:sort] == 'by_species'
      @flower_shop.flowers
    end

    def min_shelf_life(flowers, params)
      return flowers.where("shelf_life < #{params[:shelf_life]}") if !params[:shelf_life].nil?
      flowers
    end
end
