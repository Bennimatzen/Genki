class AddDurationToPrescriptions < ActiveRecord::Migration[6.0]
  def change
    add_column :prescriptions, :duration, :integer
  end
end
