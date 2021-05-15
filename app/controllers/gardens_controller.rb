class GardensController < ApplicationController
  def index
    @gardens = Garden.order(created_at: :desc)
  end

  def show
    @garden = Garden.find(params[:id])
  end

  def new
  end
end
