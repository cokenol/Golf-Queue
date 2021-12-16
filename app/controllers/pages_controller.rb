class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home

  end

  def dashboard
    @status = StatusUpdate.where_latest.by_latest
    @friendstatus = @status.select { |update| current_user.friends.include?(update.user) }
  end

  def userpost
  end
end
