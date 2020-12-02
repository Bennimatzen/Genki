class PrescriptionChecksController < ApplicationController
  def create
    @user = current_user
    @prescription = Prescription.find(params[:prescription_id])
    @prescription_check = SymptomCheck.new(prescription_check_params)

    @prescription_check.prescription = @prescription
    @prescription_check.user = @user
    @prescription_check.end = DateTime.now + @prescription.duration
    @prescription_check.reminder = true

    if @prescription_check.save
      redirect_to user_prescription_path(@prescription)
    else
      render :new
    end
  end

  def update
    @prescription_check = PrescriptionCheck.all.first
    @prescription_check.update(done: true)

    redirect_to profile_users_path
  end

  private

  def prescription_check_params
    params.require(:prescription_check).permit(:done)
  end
end
