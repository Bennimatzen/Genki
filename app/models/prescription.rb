class Prescription < ApplicationRecord
  belongs_to :doctor
  belongs_to :user
  has_many :prescription_checks

  validates :name, presence: true
  validates :dose, presence: true
  validates :frequency, presence: true

  monetize :price_cents

  def prescription_check_today?
    today = false
    if prescription_checks.any?
      today = (prescription_checks.last.created_at.to_date == Date.today)
    end
    return today
  end
end
