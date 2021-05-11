class PlotsController < ApplicationController
  def index
    @plots = Plot.all
  end
end
