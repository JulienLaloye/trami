class DashboardsController < ApplicationController
  def show
    @user = current_user
    @rooms = @user.rooms
    @appointments = @user.appointments
    @my_rooms = Room.where(user_id: @user.id)
    @rooms = Room.limit(5)
    @reviews = Review.where(user_id: @user.id)
  end

  def edit
    @my_rooms = Room.where(user_id: current_user.id)
  end

  def update
    @user = current_user
    @my_rooms = Room.where(user_id: @user.id)
    @my_rooms.update(my_rooms_params)
    redirect_to dashboard_path
  end
end
