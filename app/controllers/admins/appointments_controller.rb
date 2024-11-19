class Admins::AppointmentsController < ApplicationController
  before_action :authenticate_admin!, :find_appointment

  def index
    @appointments = Appointment.all
  end

  def show;end

  def edit;end

  def update
    if @appointment.update(appointment_params)
      redirect_to admin_appointment_path(@appointment), notice: "Appointment updated successfully."
    else
      render :edit
    end
  end

  def destroy
    @appointment.destroy
    redirect_to admin_appointments_path, notice: "Appointment deleted successfully."
  end

  private

  def find_appointment
    @appointment = Appointment.find(params[:id])
  end

  def appointment_params
    params.require(:appointment).permit(:appointment_date, :status, :notes, :doctor_id, :patient_id)
  end
end
