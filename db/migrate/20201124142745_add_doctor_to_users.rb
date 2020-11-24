class AddDoctorToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :doctor, :boolean, default: false, null: false
  end
end
