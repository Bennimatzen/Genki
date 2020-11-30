class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one_attached :photo

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :dob, presence: true
  validates :nhs_number, presence: true
  validates :gender, inclusion: { in: ["Male", "Female"] }

  has_many :diseases
  has_many :symptoms, through: :diseases
  has_many :symptomchecks
  has_many :doctors, dependent: :destroy
  has_many :appointments, dependent: :destroy
  has_many :prescriptions, dependent: :destroy
  has_many :appointment_summaries, through: :appointments, dependent: :destroy
end
