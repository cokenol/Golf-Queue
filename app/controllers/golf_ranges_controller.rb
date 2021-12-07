class GolfRangesController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[show]

  def show
    @golfrange = GolfRange.find(params[:id])
    @queues = @golfrange.queue_walls
  end
end
