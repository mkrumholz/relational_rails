class FlowerShopsController < ApplicationController
  def index
    @flower_shops = FlowerShop.order(created_at: :desc)
  end

  def show
    @flower_shop = FlowerShop.find(params[:id])
  end

  def new
  end

  def create
    FlowerShop.create(flower_shop_params)
    redirect_to '/flower_shops'
  end

  def edit
    @flower_shop = FlowerShop.find(params[:id])
  end

  def update
    flower_shop = FlowerShop.find(params[:id])
    flower_shop.update(flower_shop_params)
    redirect_to "/flower_shops/#{params[:id]}"
  end

  def destroy
    flower_shop = FlowerShop.find(params[:id])
    flower_shop.destroy
    redirect_to '/flower_shops'
  end

  private
  def flower_shop_params
    params.permit(:name, :rating, :same_day_delivery)
  end
end
