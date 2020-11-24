class CreateSymptomChecks < ActiveRecord::Migration[6.0]
  def change
    create_table :symptom_checks do |t|
      t.integer :rating
      t.text :description
      t.references :symptom, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
