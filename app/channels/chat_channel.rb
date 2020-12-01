class ChatChannel < ApplicationCable::Channel
  def subscribed
    # stream_from "some_channel"
    chat = Chat.find(params[:id])
    stream_for chat
  end

  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
