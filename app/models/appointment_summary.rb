class AppointmentSummary < ApplicationRecord
  belongs_to :appointment, dependent: :destroy

  validates :content, presence: true
  validates :plan, presence: true
end
