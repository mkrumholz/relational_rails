class FlowersController < ApplicationController
  def index
    @flowers = Flower.all
  end

  def show
    @flower = Flower.find(params[:id])
  end

  private
    def flower_params
      params.permit(:species, :shelf_life, :in_stock)
    end
end
