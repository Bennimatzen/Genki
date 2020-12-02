class AddReminderToPrescriptions < ActiveRecord::Migration[6.0]
  def change
    add_column :prescriptions, :reminder, :boolean, default: false
  end
end
