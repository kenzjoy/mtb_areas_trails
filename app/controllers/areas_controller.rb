class AreasController < ApplicationController
  def index
    @areas = Area.all.order(created_at: :desc)
  end

  def show
    @area = Area.find(params[:id])
    # require 'pry'; binding.pry
    # @gulch.trails.count
  end
end