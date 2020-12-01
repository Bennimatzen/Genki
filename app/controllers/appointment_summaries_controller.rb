class AppointmentSummariesController < ApplicationController
def index
  @appointment_summaries = AppointmentSummary.all
end

def new
  @appointment = Appointment.find(params[:appointment_id])
  @appointment_summary = AppointmentSummary.new
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
  @appointment_summary.update_all(unread: false)
end

private

def appointment_summary_params
  params.require(:appointment_summary).permit(:content, :plan)
end

end
