class NotificationsController < ApplicationController

  def index
    @notifications = current_user.notifications.sorted_unread.first(15)
  end

  def mark_read
    @notifications = current_user.notifications.sorted_unread.first(15)

    @notifications.each do |n|
      n.mark_as_read!
    end
    respond_to do |format|
        format.json { render json: { status: 'success' } }
    end
  end
end
