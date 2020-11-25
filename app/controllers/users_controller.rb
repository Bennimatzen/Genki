class UsersController < ApplicationController
  def edit
    @user = current_user
  end

  def update
    @user = current_user
    @user.update(user_params)
    redirect_to user_path(current_user)
  end

  def profile
    @user = current_user
    @symptom_checks = SymptomCheck.all
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :encrypted_password, :doctor, :dob, :gender, :nhs_number, :photo)
  end
end
