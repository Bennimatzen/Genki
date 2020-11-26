class AddAttributesToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :dob, :date
    add_column :users, :nhs_number, :string
    add_column :users, :gender, :string
  end
end
