require 'json'
require 'open-uri'

class QueueWallsController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[index filter]
  before_action :authenticate_user!, only: %i[toggle_votes new create]
  before_action :find_golfrange, only: %i[new create]

  def index
    q_num = (0..30).to_a
    @queue_count = {}
    q_num.map do |n|
      case n
      when 0..3
        @queue_count[n] = 1
      when 4..8
        @queue_count[n] = 2
      when 9..30
        @queue_count[n] = 3
      end
    end
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
    if @queue.save
      respond_to do |format|
        format.json { render json: {
          status: 'success',
          location: "/golf_ranges/#{@golfrange.id}"}};
      end
    else
      respond_to do |format|
        format.json { render json: {
          status: 'failure',
          message: 'Form missing inputs' }};
      end
      flash[:alert] = "Invalid input."
      render :new, level: @queue.level
    end

    # begin
    #   @tempfile = params["queue_wall"]["photo"].tempfile.path
    # rescue NoMethodError
    #   @queue.user = current_user
    #   @queue.golf_range = @golfrange
    #   if @queue.save
    #     redirect_to @golfrange
    #   else
    #     # raise
    #     flash[:alert] = "Invalid input."
    #     render :new, level: @queue.level
    #     # render :new, level: @queue.level
    #   end
    #   return @queue
    # end


    # begin
    #   data = Exif::Data.new(File.open(@tempfile))
    # rescue Exif::NotReadable
    #   flash[:alert] = "Photo uploaded must have EXIF data. Try taking a photo from your phone."
    #   render :new, level: @queue.level
    #   return @queue
    # end

    # if data.ifds[:exif][:date_time_original].nil?
    #   flash[:alert] = "Photo uploaded must have date-time data. Try taking a photo from your phone."
    #   # raise
    #   render :new, level: @queue.level
    # else
    #   image_date = "#{data.ifds[:exif][:date_time_original].split.first.gsub(":","/")} #{data.ifds[:exif][:date_time_original].split.last}"
    #   @queue.user = current_user
    #   @queue.image_time = DateTime.parse(image_date)
    #   @queue.golf_range = @golfrange

    #   # check that queue instance is valid to save AND image exif time is 15 mins within current_time.
    #   if (((Time.now.utc - @queue.image_time) / 60) <= 15) && @queue.save
    #     redirect_to @golfrange
    #   else
    #     # raise
    #     flash[:alert] = "Invalid input, Photo taken must be 15 minutes within posting time."
    #     render :new, level: @queue.level
    #     # render :new, level: @queue.level
    #   end
    # end
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

  def queue_wall_params
    params.require(:queue_wall).permit(:level, :queue_length, :photo, :golf_range_id, :user_id)
  end

  def find_golfrange
    @golfrange = GolfRange.find(params[:golf_range_id])
  end
end
