class AreasController < ApplicationController
  def index
    @areas = Area.all.order(created_at: :desc)
  end

  def show
    @area = Area.find(params[:id])
    @trails = @area.trail_count
  end
end