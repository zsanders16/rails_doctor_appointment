require 'pry'
class DoctorsController < ApplicationController
  before_action :set_doctor, only: [:show, :edit, :update, :destroy]
  
  def index
    @doctors = Doctor.all
  end

  def show
    @appointment = Appointment.new
    @doctor_selection = [[@doctor.name, @doctor.id]]
    @patients_selection = Patient.all.map { |p| [p.name, p.id] }
    sql = ' SELECT p.name, p.age, p.gender, a.date, a.time, a.clinic, a.id 
            FROM patients p
            INNER JOIN appointments a on a.patient_id = p.id
            INNER JOIN doctors d on a.doctor_id = d.id'
    @results = ActiveRecord::Base.connection.execute(sql)
  end

  def new
    @doctor = Doctor.new
  end

  def create
    @doctor = Doctor.new(doctor_params)
    if @doctor.save
      redirect_to @doctor
    else
      render :new
    end
    
  end

  def edit
  end

  def update

    if @doctor.update(doctor_params)
      redirect_to @doctor
    else
      render :edit
    end
    
  end

  def destroy
    @doctor.destroy
    redirect_to doctors_path
  end
  

  private 

    def set_doctor
      @doctor = Doctor.find(params[:id])
    end

    def doctor_params
      params.require(:doctor).permit(:name, :specialty)
    end
    
end
