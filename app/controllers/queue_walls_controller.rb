require 'json'
require 'open-uri'

class QueueWallsController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[index filter]
  before_action :authenticate_user!, only: :toggle_votes

  def index
    @queues = QueueWall.all
    @ranges = GolfRange.all
    @weather = weather_status(@ranges)
    return @traffic = travel_time(coords, @ranges) if cookies[:lat_lng].present?
  end

  def new
    @queue = QueueWall.new
    @queue.golf_range_id = params[:id]
    raise
  end

  def create
  end

  def toggle_votes
    @queue = QueueWall.find(params[:id])
    current_user.voted_up_on?(@queue) ? current_user.dislikes(@queue) : current_user.likes(@queue)
  end

  private

  def travel_time(coordinates, ranges)
    time_array = []
    ranges.each do |place|
      begin
    #... process, may raise an exception
        url = "https://api.mapbox.com/directions/v5/mapbox/driving/#{coordinates[1]},#{coordinates[0]};#{place.longitude},#{place.latitude}?access_token=#{ENV['MAPBOX_API_KEY']}"
        mapbox_json = URI.parse(url).open.read
        mapbox_info = JSON.parse(mapbox_json)
      rescue SocketError
          #... error handler
        puts "API Error for mapbox, try again later"
      else
        time_array << (mapbox_info["routes"].first["duration"] / 60).ceil
      end
    end
    time_array
  end

  def coords
    @lat_lng = cookies[:lat_lng].split("|")
  end

  def weather_status(ranges)
    weather_array = []
    ranges.each do |place|
      begin
        #... process, may raise an exception
        url = "https://api.openweathermap.org/data/2.5/weather?lat=#{place.latitude}&lon=#{place.longitude}&appid=#{ENV['OPENWEATHER_API_KEY']}"
        weather_json = URI.parse(url).open.read
        weather_info = JSON.parse(weather_json)
      rescue SocketError
        #... error handler
        puts "API Error for Open Weather, try again later"
      else
        weather_array << weather_info["weather"].first["icon"]
      end
    end
    weather_array
  end
end
