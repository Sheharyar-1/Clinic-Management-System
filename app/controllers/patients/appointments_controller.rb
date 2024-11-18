class Patients::AppointmentsController < ApplicationController
  before_action :authenticate_patient!

  def index
    @appointments = current_patient.appointments
  end

  def show
    @appointment = current_patient.appointments.find(params[:id])
  end

  def new
    @appointment = current_patient.appointments.build
  end

  def create
    @appointment = current_patient.appointments.build(appointment_params)
    if @appointment.save
      redirect_to patients_appointment_path(@appointment), notice: "Appointment booked successfully."
    else
      render :new
    end
  end

  private

  def appointment_params
    params.require(:appointment).permit(:appointment_date, :admin_id, :status)
  end
end
