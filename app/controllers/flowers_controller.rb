class FlowersController < ApplicationController
  def index
    @flowers = Flower.where(in_stock: true)
  end

  def show
    @flower = Flower.find(params[:id])
  end

  def edit
    @flower = Flower.find(params[:id])
  end

  def update
    flower = Flower.find(params[:id])
    flower.update(flower_params)
    redirect_to "/flowers/#{flower.id}"
  end

  private
    def flower_params
      params.permit(:species, :shelf_life, :in_stock)
    end
end
