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
    raise
    @appointment = Appointment.find(params[:id])
    @appointment.status = params[:status]
    @appointment.save
    redirect_to room_path(@appointment.room_id)
  end

  private

  def appointment_params
    params.require(:appointment).permit(:user_id, :room_id, :status, :ownership, :presence)
  end
end
