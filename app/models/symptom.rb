class Symptom < ApplicationRecord
  belongs_to :disease
  has_many :symptomchecks
end
