class FriendlistsController < ApplicationController
  before_action :authenticate_user!
  before_action :find_friend, only: %i[add_friend block_friend unblock_friend delete_friend accept_friend decline_friend]

  def search_friend
    @users = User.all
    @search = params["search"]
    if @search.present?
      @username = @search["username"]
      @usernames = User.search_by_username_email(@username)
    end
  end

  def friends_list
  end

  def add_friend
    # @friend = User.find(params[:id])
    redirect_to friends_path if current_user.friend_request(@friend)
  end

  def block_friend
    # @friend = User.find(params[:id])
    redirect_to friends_path if current_user.block_friend(@friend)
  end

  def unblock_friend
    # @friend = User.find(params[:id])
    redirect_to friends_path if current_user.unblock_friend(@friend)
  end

  def delete_friend
    # @friend = User.find(params[:id])
    redirect_to friends_path if current_user.remove_friend(@friend)
  end

  def accept_friend
    # @friend = User.find(params[:id])
    redirect_to friends_path if current_user.accept_request(@friend)
  end

  def decline_friend
    # @friend = User.find(params[:id])
    redirect_to friends_path if current_user.decline_request(@friend)
  end

  private

  def find_friend
    @friend = User.find(params[:id])
  end
end
