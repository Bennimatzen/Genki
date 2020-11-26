class AppointmentsController < ApplicationController
  before_action :set_doctor, except: [:destroy, :show, :edit, :update]

  def show
    @appointment = Appointment.find(params[:id])
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
      redirect_to profile_users_path
    else
      render :new
    end
  end

  def destroy
    @appointment = Appointment.find(params[:id])
    doctor = @appointment.doctor
    @appointment.destroy
    redirect_to doctor_path(doctor)
  end

  private

  def set_doctor
    @doctor = Doctor.find(params[:doctor_id])
  end

  def appointment_params
    params.require(:appointment).permit(:start_date, :end_date, :type, :record_share)
  end
end
