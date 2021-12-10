class PlayWallReportsController < ApplicationController
  def new
    @report = PlayWallReport.new
    @playwall= PlaywallPost.find(params[:playwall_post_id])
  end

  def create
    @report = PlayWallReport.new(post_params)
    @playwall= PlaywallPost.find(params[:playwall_post_id])
    @report.playwall_post= @playwall
    if @report.save
      redirect_to playwall_posts_path
    else
      render :new
    end
  end

private

  def post_params
    params.require(:play_wall_report).permit(:content, :playwall_post_id)
  end
end
