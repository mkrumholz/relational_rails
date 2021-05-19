class GardenPlotsController < PlotsController
  def index
    @garden = Garden.find(params[:id])
    @plots = @garden.plots
    if params[:sort] == 'by_name'
      @plots = @garden.plots_by_name
    elsif !params[:square_ft].nil?
      @plots = @garden.min_square_ft(params[:square_ft])
    end
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
