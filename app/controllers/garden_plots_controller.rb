class GardenPlotsController < PlotsController
  def index
    @garden = Garden.find(params[:id])
    @plots = @garden.plots
    if !params[:sort].nil? || !params[:square_ft].nil?
      @plots = update_view(@garden, params)
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

  private
    def update_view(garden, params)
      if params[:sort] == 'by_name'
        garden.plots_by_name
      elsif !params[:square_ft].nil?
        garden.min_square_ft(params[:square_ft])
      end
    end
end
