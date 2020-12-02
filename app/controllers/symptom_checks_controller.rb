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

    if @symptom_check.rating >= 7
      Message.create!(chat: current_user.chats.first, user: current_user, content: "Hi #{current_user.first_name.capitalize}! Your #{@symptom_check.symptom.name} is really bad today. You should talk to a doctor.", unread: true)
    end

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
