class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one_attached :photo

  validates :first_name, presence: true
  validates :last_name, presence: true

  has_many :diseases
  has_many :symptoms, through: :diseases
  has_many :symptomchecks
end
