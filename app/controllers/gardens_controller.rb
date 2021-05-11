class GardensController < ApplicationController
  def index
    @gardens = ["Garden 1", "Garden 2"]
  end
end
