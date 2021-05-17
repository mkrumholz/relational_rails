class GardenPlotsController < ApplicationController
  def index
    @garden = Garden.find(params[:id])
    if params[:sort] == 'by_name'
      @plots = Plot.where(garden_id: @garden.id).order('lower(name)')
    else
      @plots = Plot.where(garden_id: @garden.id)
    end
  end

  def new
    @garden = Garden.find(params[:id])
  end

  def create
    garden = Garden.find(params[:id])
    plot = Plot.create(plot_params)
    plot.update({garden_id: garden.id})
    redirect_to "/gardens/#{garden.id}/plots"
  end

  private
    def plot_params
      params.permit(:name, :available, :sun_coverage, :square_ft)
    end
end
