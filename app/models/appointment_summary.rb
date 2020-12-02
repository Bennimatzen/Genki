class AppointmentSummary < ApplicationRecord
  belongs_to :appointment

  has_one :doctor, through: :appointment
  has_one :user, through: :appointment

  validates :content, presence: true
  validates :plan, presence: true

  def unread_summaries_count
    AppointmentSummary.all.where(unread: true).count
  end
end
