class Doctor < ApplicationRecord
  belongs_to :user
  has_many :appointments, dependent: :destroy
  has_many :prescriptions, dependent: :destroy
  has_many :appointment_summaries, through: :appointments, dependent: :destroy
end
