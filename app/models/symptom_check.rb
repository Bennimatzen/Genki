class SymptomCheck < ApplicationRecord

  validates :rating, presence: true, inclusion: { in: 1..10, message: "Please enter a number between 1 and 10" }


  belongs_to :symptom
  belongs_to :user



end
