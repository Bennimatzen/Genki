class PrescriptionsController < ApplicationController
  def index
    @prescriptions = Prescription.all
  end

  def new
    @prescription = Prescription.new
    @user = User.find(params[:user_id])
  end

  def create
    @prescription = Prescription.new(prescription_params)
    @doctor = Doctor.find(current_user.doctors.ids.first)
    @prescription.doctor = @doctor
    @user = User.find(params[:user_id])
    @prescription.user = @user

    if @prescription.save
      redirect_to user_prescriptions_path(current_user)
    else
      render :new
    end
  end

private

  def prescription_params
    params.require(:prescription).permit(:name, :dose, :frequency, :duration)
  end

end
