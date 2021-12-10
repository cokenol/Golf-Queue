 include Pagy::Backend

class PlaywallPostsController < ApplicationController
  before_action :authenticate_user!

  def index
    @pagy, @playwall = pagy(PlaywallPost.all.by_latest)

    respond_to do |format|
        format.html
        format.json {
          render json: { entries: render_to_string(partial: "playwall_posts", locals: { playwall_posts: @playwall }, formats: [:html]),
         pagination: view_context.pagy_nav(@pagy)}
        }
    end

  end

  def new
    @playwall = PlaywallPost.new
  end

  def create
    @playwall = PlaywallPost.new(post_params)
    @playwall.user = current_user
    @playwall.save
    respond_to do |format|
      format.json { render json: { status: 'success' }  }
    end
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
