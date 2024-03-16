class AppointmentsController < ApplicationController
  def index
    @appointments = Appointment.all
  end

  def create
    @appointment = Appointment.new
    @appointment.user = current_user
    @appointment.status = params[:status]
    @appointment.room_id = params[:room_id]
    @appointment.presence = params[:presence]
    @appointment.ownership = params[:ownership]
    @appointment.save
    redirect_to room_path(@appointment.room_id)
  end

  def update
    @appointment = Appointment.find(params[:id])
    @appointment.status = params[:status]
    @room = @appointment.room
    @appointment.save
    if @room.participants >= @room.max_part
      @room.appointments.select { |appointment| appointment.status == 0 }.map { |appointment|
        appointment.status = 3
        appointment.save!
      }
    end
    @room.participants = @room.appointments.select { |appointment| appointment.status == 1 }.size
    @room.save!
    redirect_to room_path(@appointment.room_id)
  end

  private

  def appointment_params
    params.require(:appointment).permit(:user_id, :room_id, :status, :ownership, :presence)
  end
end
