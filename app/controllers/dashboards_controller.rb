class DashboardsController < ApplicationController
  def show
    @user = current_user
    @rooms = @user.rooms
    @appointments = @user.appointments
    @my_rooms = Room.where(user_id: @user.id)
  end
end
