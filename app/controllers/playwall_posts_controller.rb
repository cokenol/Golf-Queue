class PlaywallPostsController < ApplicationController
  def index
    @playwall = PlaywallPost.all

  end

  def new
    @playwall = PlaywallPost.new
  end

  def create
    @playwall = PlaywallPost.new(post_params)
    @playwall.user = current_user
    redirect_to playwall_posts_path if @playwall.save
  end

  private

  def post_params
    params.require(:playwall_post).permit(:user_id, :caption, :golf_range_id, photos: [])
  end
end
