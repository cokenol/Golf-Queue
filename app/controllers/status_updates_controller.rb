class StatusUpdatesController < ApplicationController
  before_action :authenticate_user!
  def index
    @status = StatusUpdate.all.by_latest
  end

  def create
    @status = StatusUpdate.new(status_params)
    current_user.status_update = @status

  end

  def new
  end

  def show
  end

  def edit
  end

  def update
  end

  def delete
  end

  private

  def status_params
    params.require(:status_update).permit(:user_id, :start_time, :end_time, :location)
  end
end
