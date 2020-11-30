class Message < ApplicationRecord
  belongs_to :user
  has_one :chat_message
end
