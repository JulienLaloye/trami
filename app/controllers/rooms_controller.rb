class RoomsController < ApplicationController
  def index
    dates = params[:date].split(" to ", 2)
    date_from = DateTime.parse(dates[0])
    date_to = DateTime.parse(dates[1])
    rooms = Room.where(address: params[:address])
    @rooms = rooms.select do |room|
      room.date >= date_from && room.date <= date_to
    end
  end

  def new
    @room = Room.new
    @all_activities = []
    Activity.all.each do |activity|
      @all_activities << activity.title.capitalize
    end
    @gender_options = ["Men", "Women", "No Preference", "other"]
    @languages_options = ["en", "de", "fr", "sp", "it", "other"]
  end

  def create
    @room = Room.new(room_params)
    @room.user = current_user
    @room.activity_id = params[:room][:activity_id]
    @room.save
    redirect_to room_path(@room)
  end

  def update
  end

  def show
    @room = Room.find(params[:id])
    @user_type = @room.appointments
    creation_instant = (Time.now - @room.created_at)
    if creation_instant < 60
      @creation_date = creation_instant.to_i
      @unit = "seconds"
    elsif creation_instant >= 60 && creation_instant < (60 * 60)
      @creation_date = (creation_instant / 60).to_i
      @unit = "minutes"
    elsif creation_instant >= (60 * 60) && creation_instant < (60 * 60 * 24)
      @creation_date = (creation_instant / (60 * 24)).to_i
      @unit = "hours"
    else
      @creation_date = (creation_instant / (60 * 60 * 24)).to_i
      @unit = "days"
    end
  end

  private

  def room_params
    params.require(:room).permit(:title, :description, :gender, :date, :max_part, :min_part, :adress, :language, :min_age, :max_age, :latitutde, :longitude)
  end
end
