class TrailsController < ApplicationController
  def index
    @trails = Trail.all
  end

  def show
    @trail = Trail.find(params[:id])
  end

  def edit
    @trail = Trail.find(params[:id])
  end

  def update
    trail = Trail.find(params[:id])
    trail.update(trail_params)
    redirect_to "/trail/#{trail.id}"
  end

private
  def trail_params
    params.permit(:name, :difficulty, :rating, :length, :open)
  end
end