class AppointmentsController < ApplicationController
  before_action :set_doctor, except: [:index ,:destroy]

  def index
    @appointments = Appointment.all
  end

  def new
    @appointment = Appointment.new
    @doctor = set_doctor
  end

  def create
    @appointment = Appointment.new(appointment_params)
    @appointment.doctor = @doctor
    @user = current_user
    @appointment.user = @user
    if @appointment.save
      redirect_to user_appointments_path(current_user)
    else
      render :new
    end
  end

  private

  def set_doctor
    @doctor = Doctor.find(params[:doctor_id])
  end

  def appointment_params
    params.require(:appointment).permit(:start_date, :end_date, :appointment_type, :reason, :record_share)
  end
end
