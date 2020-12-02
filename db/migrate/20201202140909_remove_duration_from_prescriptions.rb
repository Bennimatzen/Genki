class RemoveDurationFromPrescriptions < ActiveRecord::Migration[6.0]
  def change
    remove_column :prescriptions, :duration
  end
end
