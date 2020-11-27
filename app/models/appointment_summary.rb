class AppointmentSummary < ApplicationRecord
  belongs_to :appointment

  validates :content, presence: true
  validates :plan, presence: true
end
