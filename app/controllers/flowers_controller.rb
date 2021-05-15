class FlowersController < ApplicationController
  def index
    @flowers = Flower.all
  end

  def show
    @flower = Flower.find(params[:id])
  end
end
