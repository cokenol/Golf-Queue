require 'json'
require 'open-uri'

class QueueWallsController < ApplicationController
  skip_before_action :authenticate_user!, only: :index

  def index
    @queues = QueueWall.all
    @ranges = GolfRange.all
    if cookies[:lat_lng].present?
      @traffic = travel_time(coords, @ranges)
    end
  end

  def new
  end

  def create
  end

  private

  def travel_time(coordinates, ranges)
    time_array = []
    ranges.each do |place|
      url = "https://api.mapbox.com/directions/v5/mapbox/driving/#{coordinates[1]},#{coordinates[0]};#{place.longitude},#{place.latitude}?access_token=#{ENV['MAPBOX_API_KEY']}"
      mapbox_json = URI.parse(url).open.read
      mapbox_info = JSON.parse(mapbox_json)
      time_array << (mapbox_info["routes"].first["duration"] / 60).ceil
    end
    time_array
  end

  def coords
    @lat_lng = cookies[:lat_lng].split("|")
  end

end
