class QueueWallReportsController < ApplicationController

 def new
    @report = QueueWallReport.new
    @queue= QueueWall.find(params[:queue_wall_id])
  end

  def create
    @report = QueueWallReport.new(post_params)
    @queue= QueueWall.find(params[:queue_wall_id])
    @report.queue_wall = @queue
    if @report.save
      redirect_to queue_walls_path
    else
      render :new
    end
  end

private

  def post_params
    params.require(:queue_wall_report).permit(:content, :queue_wall_id)
  end

end
