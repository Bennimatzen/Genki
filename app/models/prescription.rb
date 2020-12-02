class Prescription < ApplicationRecord
  belongs_to :doctor
  belongs_to :user
  has_one :prescription_check

  validates :name, presence: true
  validates :dose, presence: true
  validates :frequency, presence: true

  monetize :price_cents
end
