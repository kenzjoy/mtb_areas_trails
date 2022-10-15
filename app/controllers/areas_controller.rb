class AreasController < ApplicationController
  def index
    @areas = Area.all.order(created_at: :desc)
  end

  def show
    @gulch = Area.find(params[:id])
    @gulch.trails.count
  end
end