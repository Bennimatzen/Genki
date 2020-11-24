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
    @user = User.find(params[:id])
    @symptom_checks = SymptomCheck.all
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :encrypted_password, :doctor)
  end
end
