class AreasController < ApplicationController
  def index
    @areas = Area.all
  end

  def show
    @gulch = Area.find(params[:id])
  end
end