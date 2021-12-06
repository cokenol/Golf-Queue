class QueueWallsController < ApplicationController
  skip_before_action :authenticate_user!, only: :index

  def index
    @queues = QueueWall.all
  end

  def new
  end

  def create
  end
end
