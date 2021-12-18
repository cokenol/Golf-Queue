class NotificationsController < ApplicationController

  def index
    # begin
    #   if current_user.notifications.unread.count.zero?
    #     @notifications = current_user.notifications.newest_first.first(15)
    #   else
    #     @notifications = current_user.notifications.sorted_unread.first(15)
    #   end
    # rescue ActiveRecord::RecordNotFound
      @notifications = current_user.notifications.unread.reverse.first(15)
    # end
  end

  def mark_read
    index
    @notifications.each do |n|
      n.mark_as_read!
    end
    respond_to do |format|
        format.json { render json: { status: 'success' } }
    end
  end
end
