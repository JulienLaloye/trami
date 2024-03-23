class DashboardsController < ApplicationController
  def show
    @user = current_user
    @rooms = @user.rooms.where.not(user: @user)
    @rooms = @rooms.select { |room| room.date >= Date.today }
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
    @my_rooms = @my_rooms.select { |room| room.date >= Date.today }
    @my_rooms.update(my_rooms_params)
    redirect_to dashboard_path
  end
end
