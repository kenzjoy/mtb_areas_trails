class AreaTrailsController < ApplicationController
  def index
    @area = Area.find(params[:area_id])
    @trails = @area.trails
  end
end