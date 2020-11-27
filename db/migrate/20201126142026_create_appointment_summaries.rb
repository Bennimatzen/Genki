class CreateAppointmentSummaries < ActiveRecord::Migration[6.0]
  def change
    create_table :appointment_summaries do |t|
      t.references :appointment, null: false, foreign_key: true
      t.text :content
      t.text :plan

      t.timestamps
    end
  end
end
