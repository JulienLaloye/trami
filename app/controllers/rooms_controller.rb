class RoomsController < ApplicationController
  def index
    @rooms = Room.all
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
    @room.save
    redirect_to room_path(@room)
  end

  def update
  end

  def show
    @room = Room.find(params[:id])
    @user_type = @room.appointments
  end

  private

  def room_params
    params.require(:room).permit(:title, :description, :gender, :date, :max_part, :min_part, :adress, :language, :min_age, :max_age, :latitutde, :longitude)
  end
end
