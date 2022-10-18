class AreaTrailsController < ApplicationController
  def index
    @area = Area.find(params[:area_id])
    @trails = @area.trails
  end

  def new
    @area = Area.find(params[:area_id])
  end
  
  def create
    @area = Area.find(params[:area_id])
    @trail = @area.trails.create!(area_trails_params)
    redirect_to "/areas/#{@area.id}/trails"
  end

private
  def area_trails_params
    params.permit(:name, :difficulty, :rating, :length, :open)
  end
end