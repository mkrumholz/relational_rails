class GardenPlotsController < PlotsController
  def index
    @garden = Garden.find(params[:id])
    sorted_plots = @garden.sort_order(params)
    @plots = min_square_ft(sorted_plots, params)
  end

  def new
    @garden = Garden.find(params[:id])
  end

  def create
    garden = Garden.find(params[:id])
    plot = garden.plots.create(plot_params)
    redirect_to "/gardens/#{garden.id}/plots"
  end

  private
    def min_square_ft(sorted_plots, params)
      return sorted_plots.larger_than(params[:square_ft]) if !params[:square_ft].nil?
      sorted_plots
    end
end
