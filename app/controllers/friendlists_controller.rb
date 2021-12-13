class FriendlistsController < ApplicationController
  before_action :authenticate_user!

  # def search_friend
  # end

  def friends_list
  end

  # def show_friend
  # end

  # def add_friend
  # end

  # def block_friend
  # end

  def delete_friend
    @friend = User.find(params[:id])
    redirect_to friends_path if current_user.remove_friend(@friend)
  end

  # def pending_friend
  # end

  # def requested_friend
  # end
end
