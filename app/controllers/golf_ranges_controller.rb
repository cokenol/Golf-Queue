class GolfRangesController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[show]

  def show
    @queues = GolfRange.find(params[:id]).queue_walls
  end
end
