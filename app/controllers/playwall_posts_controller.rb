 include Pagy::Backend

class PlaywallPostsController < ApplicationController
  before_action :authenticate_user!

  def index
    @pagy, @playwall = pagy(PlaywallPost.all)
  end

  def new
    @playwall = PlaywallPost.new
  end

  def create
    @playwall = PlaywallPost.new(post_params)
    @playwall.user = current_user
    redirect_to playwall_posts_path if @playwall.save
  end

  def toggle_favorite
    @playwall = PlaywallPost.find(params[:id])
    current_user.favorited?(@playwall) ? current_user.unfavorite(@playwall) : current_user.favorite(@playwall)
  end

  private

  def post_params
    params.require(:playwall_post).permit(:user_id, :caption, :golf_range_id, photos: [])
  end
end
