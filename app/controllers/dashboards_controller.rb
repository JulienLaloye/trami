class DashboardsController < ApplicationController
  def show
    @user = current_user
    @rooms = @user.rooms
    @appointments = @user.appointments
    @my_rooms = Room.where(user_id: @user.id)
    @rooms = Room.limit(5)
    @reviews = Review.where(user_id: @user.id)
  end
end
