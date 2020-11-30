class Chat < ApplicationRecord
  belongs_to :doctor
  belongs_to :user

  has_many :messages, dependent: :destroy
end
