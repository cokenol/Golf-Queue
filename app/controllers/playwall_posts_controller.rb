 include Pagy::Backend

class PlaywallPostsController < ApplicationController
  before_action :authenticate_user!

  def index
    @pagy, @playwall = pagy(PlaywallPost.not_deleted.by_latest)

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
    puts GolfRange.find(post_params[:golf_range_id]).name
    puts coords
    # if within_range?(coords, GolfRange.find(post_params[:golf_range_id]))
      @playwall.save
      respond_to do |format|
        format.json {
          render json: {
            status: 'success',
            location: "/playwall_posts"
            }
        }
      end
    # else
    #   respond_to do |format|
    #     format.json { render json: {
    #       status: 'failure',
    #       message: "You need to be near the golf range; to post!"
    #       }
    #     }
    #   end
    # end
  end

  def destroy
    @playwall = PlaywallPost.find(params[:id])
    @playwall.display = false
    redirect_to playwall_posts_path if @playwall.save
  end

  def show
    @playwall = PlaywallPost.find(params[:id])
  end

  def toggle_favorite
    @playwall = PlaywallPost.find(params[:id])
    current_user.favorited?(@playwall) ? current_user.unfavorite(@playwall) : current_user.favorite(@playwall)
  end

  private

  def post_params
    params.require(:playwall_post).permit(:user_id, :caption, :golf_range_id, photos: [])
  end

  def coords
    # [1.3654221803946198, 103.74839086837488]
    @lat_lng = cookies[:lat_lng].split("|").join(",")
  end

  def within_range?(coords, range)
    range.distance_to(coords) <= 2
  end
end
