class QueueWallsController < ApplicationController
  skip_before_action :authenticate_user!, only: :index

  def index
    @ranges = GolfRange.all
  end

  def new
  end

  def create
  end
end
