class PrescriptionsController < ApplicationController
  # before_action :set_user, only: [:show]

  def index
    @prescriptions = Prescription.all
  end

  def show
    @prescription = Prescription.find(params[:id])
    @order = Order.new
    @pharmacies = Pharmacy.all
    @markers = @pharmacies.geocoded.map do |pharmacy|
      {
        lat: pharmacy.latitude,
        lng: pharmacy.longitude
      }
    end
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
      Message.create!(chat: current_user.chats.first, user: current_user, content: "Hi #{current_user.first_name.capitalize}! Dr. #{@doctor.user.last_name.capitalize} gave you a new prescription.", unread: true)
      redirect_to root_path
    else
      render :new
    end
  end

  def update
    @prescription = Prescription.find(params[:id])
    @prescription.update(reminder: true)
    Message.create!(chat: current_user.chats.first, user: current_user, content: "Hi #{current_user.first_name.capitalize}! you have set a daily reminder for your #{@prescription.name} prescription. Don't forget to take your meds!", unread: true)

    redirect_to profile_users_path(current_user)
  end

private

  def set_user
    @user = User.find(params[:user_id])
  end

  def prescription_params
    params.require(:prescription).permit(:name, :dose, :frequency, :duration, :price, :sku)
  end
end
