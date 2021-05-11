class GardensController < ApplicationController
  def index
    @gardens = Garden.all
  end
end
