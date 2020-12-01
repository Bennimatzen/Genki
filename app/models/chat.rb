class Chat < ApplicationRecord
  belongs_to :doctor
  belongs_to :user

  has_many :messages, dependent: :destroy

  def unread_messages_count
    messages.where(unread: true).count
  end
end
