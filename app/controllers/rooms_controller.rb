class RoomsController < ApplicationController
  def index
    @rooms = Room.all
  end

  def new
    @room = Room.new
    @all_moods = []
    Mood.all.each do |mood|
      @all_moods << mood.name.capitalize
    end
  end

  def create
    @room = Restaurant.new(room_params)
    @room.save
    redirect_to room_path(@room)
  end

  def update
  end

  private

  def room_params
    params.require(:room).permit(:title, :description, :gender, :date, :max_part, :min_part, :adress, :language, :min_age, :max_age, :latitutde, :longitude)
  end
end
