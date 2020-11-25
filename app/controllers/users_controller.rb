class UsersController < ApplicationController
  def edit
    @user = current_user
  end

  def update
    @user = current_user
    @user.update(user_params)
    redirect_to user_path(current_user)
  end

  def show
    @user = current_user
    @symptom_checks = SymptomCheck.all
    @symptom_check = SymptomCheck.new
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :encrypted_password, :doctor)
  end
end
