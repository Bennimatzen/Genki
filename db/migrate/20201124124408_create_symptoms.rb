class CreateSymptoms < ActiveRecord::Migration[6.0]
  def change
    create_table :symptoms do |t|
      t.string :name
      t.references :disease, null: false, foreign_key: true

      t.timestamps
    end
  end
end
