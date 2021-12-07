require 'json'
require 'open-uri'

class QueueWallsController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[index filter]

  def index
    @queues = QueueWall.all
    @ranges = GolfRange.all
    @weather = weather_status(@ranges)
    return @traffic = travel_time(coords, @ranges) if cookies[:lat_lng].present?
  end

  def new
  end

  def create
  end

  def filter
    @queues = QueueWall.by_range(params[:id])
    # raise
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

  def weather_status(ranges)
    weather_array = []
    ranges.each do |place|
      url = "https://api.openweathermap.org/data/2.5/weather?lat=#{place.latitude}&lon=#{place.longitude}&appid=#{ENV['OPENWEATHER_API_KEY']}"
      weather_json = URI.parse(url).open.read
      weather_info = JSON.parse(weather_json)
      weather_array << weather_info["weather"].first["icon"]
    end
    weather_array
  end

end
