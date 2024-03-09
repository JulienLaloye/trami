class AppointmentsController < ApplicationController
  def index
    @appointments = Appointment.all
  end

  def create
  end

  def update
    
  end
end
