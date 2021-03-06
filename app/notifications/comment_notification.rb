# To deliver this notification:
#
# CommentNotification.with(post: @post).deliver_later(current_user)
# CommentNotification.with(post: @post).deliver(current_user)

class CommentNotification < Noticed::Base
  # Add your delivery methods
  #
  deliver_by :database, format: :to_database
  # deliver_by :action_cable, format: :to_action_cable
  # deliver_by :email, mailer: "UserMailer"
  # deliver_by :slack
  # deliver_by :custom, class: "MyDeliveryMethod"
  # deliver_by :ios

  # Add required params
  #
  # param :post

  # Define helper methods to make rendering easier.
  #
  def to_database
    {
      type: self.class.name,
      params: params,
    }
  end

  param :comment

  def message
    t(".message")
  end

  def url
    post_path(params[:comment])
  end
end
