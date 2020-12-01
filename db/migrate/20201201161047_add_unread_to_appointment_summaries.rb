class AddUnreadToAppointmentSummaries < ActiveRecord::Migration[6.0]
  def change
    add_column :appointment_summaries, :unread, :boolean, default: true
  end
end
