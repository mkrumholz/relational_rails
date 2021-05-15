class FlowersController < ApplicationController
  def index
    @flowers = Flower.all
  end
end
