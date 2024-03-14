class DashboardsController < ApplicationController
  def show
    @user = current_user
    @rooms = @user.rooms.where.not(user: @user)
    @appointments = @user.appointments
    @my_rooms = Room.where(user: @user)
    @reviews = Review.where(user: @user)
  end

  def edit
    @my_rooms = Room.where(user: current_user)
  end

  def update
    @user = current_user
    @my_rooms = Room.where(user: @user.id)
    @my_rooms.update(my_rooms_params)
    redirect_to dashboard_path
  end
end
