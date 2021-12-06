require 'json'
require 'open-uri'

class QueueWallsController < ApplicationController
  skip_before_action :authenticate_user!, only: :index

  def index
    @queues = QueueWall.all
    if cookies[:lat_lng].present?
      travel_time(coords)
    end
  end

  def new
  end

  def create
  end

  private

  def travel_time(coordinates)
    url = "https://api.mapbox.com/directions/v5/mapbox/driving/#{coordinates[1]},#{coordinates[0]};103.8693475,1.2933014?access_token=#{ENV['MAPBOX_API_KEY']}"
    mapbox_json = URI.parse(url).open.read
    mapbox_info = JSON.parse(mapbox_json)

    puts (mapbox_info["routes"].first["duration"] / 60).ceil
    puts "mins"
  end

  def coords
    @lat_lng = cookies[:lat_lng].split("|")
  end

end
