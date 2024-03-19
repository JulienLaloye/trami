class RoomsController < ApplicationController
  def index
    if current_user
      possible_moods = ["relax", "dreamy", "energetic", "neutral", "social", "competitive", "adventurous", "chillin", "creative", "intellectual", "exploratory", "mindful"]

      selected_mood_names = params.keys.map(&:downcase).select { |key| possible_moods.include?(key) }
      Rails.logger.debug "Selected mood names: #{selected_mood_names.inspect}"

      @rooms = Room.joins(activity: :mood).where(moods: { name: selected_mood_names })
      @rooms = @rooms.where(address: params[:address])
      date_params
    else
      @rooms = Room.where(address: params[:address])
      date_params
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
    @appointment = Appointment.new(user: current_user, room: @room, ownership: true, presence: true, status: 1)
    @appointment.save
    redirect_to room_path(@room)
  end

  def update
    @room = @room = Room.find(params[:id])
    @room.update(room_params)
    @room.save!
    redirect_to room_path(@room)
  end

  def show
    @room = Room.find(params[:id])
    @chatroom = Chatroom.find_by(room: @room)
    @message = Message.new
    @user_type = @room.appointments
    creation_instant = (Time.now - @room.created_at)
    if creation_instant < 60
      @creation_date = creation_instant.to_i
      @unit = "seconds"
    elsif creation_instant >= 60 && creation_instant < (60 * 60)
      @creation_date = (creation_instant / 60).to_i
      @unit = "minutes"
    elsif creation_instant >= (60 * 60) && creation_instant < (60 * 60 * 24)
      @creation_date = (creation_instant / (60 * 60)).to_i
      @unit = "hours"
    else
      @creation_date = (creation_instant / (60 * 60 * 24)).to_i
      @unit = "days"
    end
    if current_user
      @currentuser_rooms = []
      current_user.appointments.each do |appointment|
        @currentuser_rooms << appointment.room
      end
    end
  end

  private

  def room_params
    params.require(:room).permit(:title, :description, :gender, :date, :max_part, :min_part, :address, :language, :min_age, :max_age, :latitutde, :longitude)
  end

  def date_params
    if params[:date].present?
      dates = params[:date].split(" to ", 2)
      @date_from = DateTime.parse(dates[0])
      @date_to = DateTime.parse(dates[1])
      @rooms = @rooms.select do |room|
      room.date >= @date_from && room.date <= @date_to
      end
    else
      params[:date] = ''
      @rooms = Room.where(date: params[:date])
    end
  end
end
