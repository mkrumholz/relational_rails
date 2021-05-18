class PlotsController < ApplicationController
  def index
    @plots = Plot.all
  end

  def show
    @plot = Plot.find(params[:id])
  end

  def edit
    @plot = Plot.find(params[:id])
  end

  def update
    plot = Plot.find(params[:id])
    plot.update(plot_params)
    redirect_to "/plots/#{plot.id}"
  end

  private
    def plot_params
      params.permit(:name, :available, :sun_coverage, :square_ft)
    end
end
