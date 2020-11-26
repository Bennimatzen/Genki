class SymptomChecksController < ApplicationController
  def new
    @symptom_check = SymptomCheck.new
  end

  def create
    @user = current_user
    @symptom = @user.symptoms.first
    @symptom_check = SymptomCheck.new(symptom_check_params)
    @symptom_check.symptom = @symptom
    @symptom_check.user = @user
    if @symptom_check.save
      redirect_to profile_users_path
    else
      render :new
    end
  end

  private

  def symptom_check_params
    params.require(:symptom_check).permit(:rating, :description)
  end
end
