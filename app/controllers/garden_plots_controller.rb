class GardenPlotsController < PlotsController
  def index
    @garden = Garden.find(params[:id])
    return @plots = @garden.plots_by_name if params[:sort] == 'by_name'
    @plots = @garden.plots
  end

  def new
    @garden = Garden.find(params[:id])
  end

  def create
    garden = Garden.find(params[:id])
    plot = garden.plots.create(plot_params)
    redirect_to "/gardens/#{garden.id}/plots"
  end
end
