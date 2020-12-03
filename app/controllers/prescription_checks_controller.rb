class PrescriptionChecksController < ApplicationController
  def create
    @user = current_user
    @prescription = Prescription.find(params[:pid]) # PrescriptionCheck.all.first
    @prescription_check = PrescriptionCheck.new

    @prescription_check.prescription = @prescription
    @prescription_check.user = @user
    # @prescription_check.end = DateTime.now + @prescription.duration
    @prescription_check.done = true

    if @prescription_check.save
      redirect_to profile_users_path
    else
      render :new
    end
  end
end
