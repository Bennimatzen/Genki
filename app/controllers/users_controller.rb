class UsersController < ApplicationController
  def show
    @user = current_user
    @doctors = Doctor.all
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    @user.update(user_params)
    redirect_to user_path(current_user)
  end

  def profile
    @sliced = []
    if current_user.doctors.any?
      redirect_to doctor_path(current_user.doctors.first)
    else
      @user = current_user
      @symptom_checks = SymptomCheck.all
      @symptom_check = SymptomCheck.new
      @symptom_checks.each do |check|
        @sliced << [check.created_at.to_date, check.rating]
      end
      @appointments = current_user.appointments
    end
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :encrypted_password, :doctor, :dob, :gender, :nhs_number, :photo)
  end
end
