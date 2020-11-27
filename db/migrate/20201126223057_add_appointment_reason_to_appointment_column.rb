class AddAppointmentReasonToAppointmentColumn < ActiveRecord::Migration[6.0]
  def change
    add_column :appointments, :reason, :text
  end
end
