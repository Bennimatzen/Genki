class SymptomCheck < ApplicationRecord
  belongs_to :symptom
  belongs_to :user
end
