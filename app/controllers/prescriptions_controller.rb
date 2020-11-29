class PrescriptionsController < ApplicationController
  def index
    @prescriptions = Prescription.all
  end
end
