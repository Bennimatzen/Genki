class PrescriptionsController < ApplicationController
  before_action :set_user, only: [:show]

  def index
    @prescriptions = Prescription.all
  end

  def show
    @prescription = Prescription.find(params[:id])
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

  def set_user
    @user = User.find(params[:user_id])
  end

  def prescription_params
    params.require(:prescription).permit(:name, :dose, :frequency, :duration, :price, :sku)
  end
end
