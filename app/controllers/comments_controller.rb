class CommentsController < ApplicationController

  def index
    @comments = Comment.all.by_latest
  end

  def new
  end

  def show
  end

  def create
  end
end
