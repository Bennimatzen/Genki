class RemoveDoctorFromUsers < ActiveRecord::Migration[6.0]
  def change
    remove_column :users, :doctor, :boolean
  end
end
