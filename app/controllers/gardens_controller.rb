class GardensController < ApplicationController
  def index
    @gardens = Garden.order(created_at: :desc)
  end

  def show
    @garden = Garden.find(params[:id])
  end

  def new
  end

  def create
     Garden.create(garden_params)
     redirect_to '/gardens'
  end

  private
    def garden_params
      params.permit(:name, :water_on, :water_access_pts)
    end
end
