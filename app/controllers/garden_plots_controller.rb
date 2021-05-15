class GardenPlotsController < ApplicationController
  def index
    @plots = Plot.where(garden_id: params[:id])
  end
end
