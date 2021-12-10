class CommentsController < ApplicationController
  before_action :authenticate_user!

  def index
    @comment = Comment.new
    @playwall = PlaywallPost.find(params[:playwall_post_id])
    @comment.playwall_post = @playwall

    @pagy, @comments = pagy(PlaywallPost.find(params[:playwall_post_id]).comments.by_latest, items: 15)
    respond_to do |format|
        format.html
        format.json {
         render json: { entries: render_to_string(partial: "comments", locals: { comments: @comments }, formats: [:html]),
         pagination: view_context.pagy_nav(@pagy)}
        }
    end
  end

  def new
    @comment = Comment.new
    @playwall = PlaywallPost.find(params[:playwall_post_id])
    @comment.playwall_post = @playwall
  end

  def show
    @playwall = PlaywallPost.find(params[:id])
    @comment.playwall_post = @playwall
  end

  def create
    @comment = Comment.new(comment_params)
    @playwall = PlaywallPost.find(params[:playwall_post_id])
    @comment.user = current_user
    @comment.playwall_post = @playwall
    redirect_to playwall_post_comments_path if @comment.save
  end

  private

  def comment_params
    params.require(:comment).permit(:user_id, :content, :playwall_post_id)
  end
end
