class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home

  end

  def dashboard
    @status = StatusUpdate.all.by_latest
  end

  def userpost

  end
end
