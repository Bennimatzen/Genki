class SymptomsController < ApplicationController
  def new
    @disease = Disease.find(params[:disease_id])
    @symptom = Symptom.new
  end

  def create
    @disease = Disease.find(params[:disease_id])

    @symptom = Symptom.new(symptom_params)
    @symptom.disease = @disease

    if @symptom.save
      redirect_to user_path(current_user)
    else
      render :new
    end
  end

  private

  def symptom_params
    params.require(:symptom).permit(:name, :disease_id)
  end
end
