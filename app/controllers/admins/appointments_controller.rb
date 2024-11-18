class Admins::AppointmentsController < ApplicationController
  before_action :authenticate_admin!

  def index
    @appointments = Appointment.all
  end

  def show
    @appointment = Appointment.find(params[:id])
  end

  def edit
    @appointment = Appointment.find(params[:id])
  end

  def update
    @appointment = Appointment.find(params[:id])
    if @appointment.update(appointment_params)
      redirect_to admin_appointment_path(@appointment), notice: "Appointment updated successfully."
    else
      render :edit
    end
  end

  def destroy
    @appointment = Appointment.find(params[:id])
    @appointment.destroy
    redirect_to admin_appointments_path, notice: "Appointment deleted successfully."
  end

  private

  def appointment_params
    params.require(:appointment).permit(:appointment_date, :status, :notes, :doctor_id, :patient_id)
  end
end
