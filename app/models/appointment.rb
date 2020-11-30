class Appointment < ApplicationRecord
  belongs_to :user
  belongs_to :doctor
  has_many :appointment_summaries, dependent: :destroy
end
