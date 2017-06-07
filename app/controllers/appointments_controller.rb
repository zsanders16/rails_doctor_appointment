class AppointmentsController < ApplicationController
  before_action :set_appointment, only: [:edit, :update, :destroy]

  def create
    @appointment = Appointment.new(appointment_params)
    
    @appointment.save
    redirect_to doctor_path(params[:appointment][:doctor_id])
  end

  def edit
    @doctor = Doctor.find(@appointment.doctor_id)
    @doctor_selection = [[@doctor.name, @doctor.id]]
    @patients_selection = Patient.all.map { |p| [p.name, p.id] }
  end

  def update
    if @appointment.update(appointment_params)
      redirect_to doctor_path(@appointment.doctor_id)
    else
      render :edit
    end
  end
  
  def destroy
    
    @appointment.destroy
    redirect_to doctor_path(@appointment.doctor_id)
  end
  

  private

    def appointment_params
      params.require(:appointment).permit(:doctor_id, :patient_id, :date, :time, :clinic)
    end

    def set_appointment
      @appointment = Appointment.find(params[:id])
    end
    
    
end


