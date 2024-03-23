class RoomsController < ApplicationController
  def index
    possible_moods = ["relax", "dreamy", "energetic", "neutral", "social", "competitive", "adventurous", "chillin", "creative", "intellectual", "exploratory", "mindful"]
    cap = possible_moods.each(&:capitalize)
    @address_params = params[:address].present?
    if @address_params
      if params[cap].present?
        @selected_mood_names = params.keys.map(&:downcase).select { |key| possible_moods.include?(key) }
        Rails.logger.debug "Selected mood names: #{@selected_mood_names.inspect}"

        @rooms = Room.joins(activity: :mood).where(moods: { name: @selected_mood_names })
        if params[:date].present?
          dates = params[:date].split(" to ", 2)
          @date_from = DateTime.parse(dates[0])
          @date_to = DateTime.parse(dates[1])
          @rooms = @rooms.where("date >= ? AND date <= ?", @date_from, @date_to)
        else
          params[:date] = ''
          @rooms = @rooms.where(date: params[:date])
        end
      else
        if params[:date].present?
          dates = params[:date].split(" to ", 2)
          @date_from = DateTime.parse(dates[0])
          @date_to = DateTime.parse(dates[1])
          @rooms = Room.where("date >= ? AND date <= ?", @date_from, @date_to)
        else
          params[:date] = ''
          @rooms = Room.where(date: params[:date])
        end
      end
      address = params[:address]
      @rooms = @rooms.where("address LIKE ?", "%#{address}%")
    else
      @rooms = Room.all
    end

    @markers = @rooms.geocoded.map do |room|
      {
        lat: room.latitude,
        lng: room.longitude,
        info_window_html: render_to_string(partial: "info_window", locals: {room: room}),
        marker_html: render_to_string(partial: "marker",locals: {room: room}),
      }
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
end
