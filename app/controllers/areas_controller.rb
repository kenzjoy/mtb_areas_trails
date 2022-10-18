class AreasController < ApplicationController
  def index
    @areas = Area.all.order(created_at: :desc)
    # @areas = Area.order_by_created_at
  end

  def show
    @area = Area.find(params[:id])
    @trails = @area.trail_count
  end

  def new
  end

  def create
    @area = Area.create!(area_params)
    redirect_to "/areas"
  end

  def area_params
    params.permit(:name, :region, :peak_elevation, :alpine)
  end

end