class GardenPlotsController < PlotsController
  def index
    @garden = Garden.find(params[:id])
    plots = sort_order(params)
    @plots = min_square_ft(plots, params)
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
    def sort_order(params)
      return @garden.plots_by_name if params[:sort] == 'by_name'
      @garden.plots
    end

    def min_square_ft(plots, params)
      return plots.where("square_ft > #{params[:square_ft]}") if !params[:square_ft].nil?
      plots
    end
end
