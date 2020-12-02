class CreatePrescriptionChecks < ActiveRecord::Migration[6.0]
  def change
    create_table :prescription_checks do |t|
      t.boolean :done
      t.boolean :reminder
      t.datetime :end
      t.references :prescription, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
