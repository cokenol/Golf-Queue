require 'json'
require 'open-uri'

class QueueWallsController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[index filter]
  before_action :find_golfrange, only: %i[new create]

  def index
    @queues = QueueWall.all
    @ranges = GolfRange.all
    @weather = weather_status(@ranges)
    return @traffic = travel_time(coords, @ranges) if cookies[:lat_lng].present?
  end

  def new
    @queue = QueueWall.new
    @queue.golf_range_id = @golfrange.id
  end

  def create
    @queue = QueueWall.new(queue_wall_params)
    @queue.user = current_user
    @queue.golf_range = @golfrange
    # raise
    if @queue.save
      redirect_to @golfrange
    else
      render :new, level: @queue.level
    end
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

  def queue_wall_params
    params.require(:queue_wall).permit(:level, :queue_length, :photo, :golf_range_id, :user_id)
  end

  def find_golfrange
    @golfrange = GolfRange.find(params[:golf_range_id])
  end
end
