class DiseasesController < ApplicationController
  def new
    @user = current_user
    @disease = Disease.new # needed to instantiate the form_for
  end

  def create
    @disease = Disease.new(disease_params)
    @disease.user = current_user
    if @disease.save
      redirect_to user_path(current_user)
    else
      render :new
    end
  end

  private

  def disease_params
    params.require(:disease).permit(:name, :user_id)
  end
end
