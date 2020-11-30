class AppointmentSummariesController < ApplicationController

def new
  @appointment = Appointment.find(params[:appointment_id])
  @appointment_summary = AppointmentSummary.new(appointment_summary_params)
end

def create
  @appointment = Appointment.find(params[:appointment_id])
  @appointment_summary = AppointmentSummary.new(appointment_summary_params)
  @appointment_summary.appointment = @appointment
  if @appointment_summary.save
    redirect_to appointment_summary_path(@appointment_summary)
  else
    render :new
  end
end

def show
  @appointment_summary = AppointmentSummary.find(params[:id])
end

private

def appointment_summary_params
  params.require(:appointment_summary).permit(:content, :plan)
end

end
