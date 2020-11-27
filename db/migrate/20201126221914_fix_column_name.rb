class FixColumnName < ActiveRecord::Migration[6.0]
  def change
    rename_column :appointments, :type, :appointment_type
  end
end
