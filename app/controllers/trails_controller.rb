class TrailsController < ApplicationController
  def index
    @trails = Trail.all
  end

  def show
    @goulding = Trail.find(params[:id])
  end
end