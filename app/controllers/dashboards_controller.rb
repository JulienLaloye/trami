class DashboardsController < ApplicationController
  def show
    @user = current_user
    @rooms = @user.rooms
    @appointments = @user.appointments
    @my_rooms = Room.where(user_id: @user.id)
    @rooms = Room.limit(2)
    # @rooms = Room.all
  end
end
