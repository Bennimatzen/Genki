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
    Message.create!(chat: current_user.chats.first, user: current_user, content: "Hi #{current_user.first_name.capitalize}! Dr. #{@appointment.doctor.user.last_name} has sent you a new appointment letter. Make sure to complete your action plan!.", unread: true)
    redirect_to root_path
  else
    render :new
  end
end

def show
  @appointment_summary = AppointmentSummary.find(params[:id])
  @appointment_summary.update(unread: false)
end

private

def appointment_summary_params
  params.require(:appointment_summary).permit(:content, :plan)
end

end
