require 'json'
require 'open-uri'

class QueueWallsController < ApplicationController
  skip_before_action :authenticate_user!, only: :index

  def index
    @queues = QueueWall.all
    @ranges = GolfRange.all
    travel_time

  end

  def new
  end

  def create
  end

  private

  def travel_time
    url = "https://api.mapbox.com/directions/v5/mapbox/driving/103.8404503,1.3022018;103.8693475,1.2933014?access_token=#{ENV['MAPBOX_API_KEY']}"
  # answer_serialized = URI.open(url).read
    movies = URI.parse(url).open.read
    movie_list = JSON.parse(movies)

    puts (movie_list["routes"].first["duration"] / 60).ceil
  end
end
