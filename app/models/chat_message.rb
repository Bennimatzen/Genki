class ChatMessage < ApplicationRecord
  belongs_to :chat
  belongs_to :message
end
