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

  def edit
    @garden = Garden.find(params[:id])
  end

  def update
    garden = Garden.find(params[:id])
    garden.update({
      name: params[:name],
      water_on: params[:water_on],
      water_access_pts: params[:water_access_pts]
      })
    garden.save
    redirect_to "/gardens/#{params[:id]}"
  end

  private
    def garden_params
      params.permit(:name, :water_on, :water_access_pts)
    end
end
