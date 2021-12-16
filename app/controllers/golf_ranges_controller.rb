class GolfRangesController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[show]

  def show
    @golfrange = GolfRange.find(params[:id])
    @queues = @golfrange.queue_walls

    if current_user.present?
      @status = StatusUpdate.where_latest.by_latest
      @friendstatus = @status.select do |update|
        current_user.friends.include?(update.user) && update.golf_range == @golfrange
      end
    end
  end
end
