class GardenPlotsController < ApplicationController
  def index
    binding.pry
    @plots = Plot.where()
  end
end
