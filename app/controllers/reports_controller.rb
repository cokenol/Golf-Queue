class ReportsController < ApplicationController

 def new
    @report = Report.new

  end

  def create
    @report = Report.new(post_params)
    @report.user = current_user
    redirect_to playwall_posts_path if @playwall.save
    raise
  end

private

  def post_params
    params.require(:report).permit()
  end

end
