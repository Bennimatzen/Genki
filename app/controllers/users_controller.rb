class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    @symptom_checks = SymptomCheck.all

  end
end
