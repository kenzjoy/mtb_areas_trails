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
    @area = Area.create!(name: params[:name], region: params[:region], peak_elevation: params[:peak_elevation])
    redirect_to "/areas"
  end
end