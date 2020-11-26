class DoctorsController < ApplicationController

  def show
    @doctor = Doctor.find(params[:id])
    @user = current_user
  end

  def new
    @doctor = Doctor.new
    @user = current_user
  end

  def create
    @doctor = Doctor.new(doctors_params)
    @doctor.user = current_user
    if @doctor.save
      redirect_to doctor_path(@doctor)
    else
      render :new
    end
  end

  private
  def doctors_params
    params.require(:doctor).permit(:specialty, :description)
  end
end
