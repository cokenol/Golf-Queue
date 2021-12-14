class StatusUpdatesController < ApplicationController
  before_action :authenticate_user!

  def index
    @status = StatusUpdate.all.by_latest
  end

  def create
    @start_time = DateTime.new(params["status_update"]["start_date"].split("-")[0].to_i,params["status_update"]["start_date"].split("-")[1].to_i,params["status_update"]["start_date"].split("-")[2].to_i,params["status_update"]["starttime(4i)"].to_i,params["status_update"]["starttime(5i)"].to_i,00, '+8:00')
    @end_time = DateTime.new(params["status_update"]["start_date"].split("-")[0].to_i,params["status_update"]["start_date"].split("-")[1].to_i,params["status_update"]["start_date"].split("-")[2].to_i,params["status_update"]["endtime(4i)"].to_i,params["status_update"]["endtime(5i)"].to_i,00, '+8:00')
    @status = StatusUpdate.new(status_params)
    @golf_range = GolfRange.find(params["status_update"]["golf_range_id"])
    @status.golf_range = @golf_range
    @status.start_time = @start_time
    @status.end_time = @end_time
    @status.user = current_user
    redirect_to request.referer if @status.save
  end

  def new
    @status = StatusUpdate.new
  end


  def delete
    @status = StatusUpdate.find(params[:id])
    redirect_to request.referer if @status.destroy
  end

  private

  def status_params
    params.require(:status_update).permit(:user_id, :start_date, :endtime, :starttime, :golf_range_id)
  end
end
