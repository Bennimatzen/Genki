class MessagesController < ApplicationController
  def create
    @chat = Chat.find(params[:chat_id])
    @message = Message.new(message_params)
    @message.chat = @chat
    @message.user = current_user
    if @message.save
      ChatChannel.broadcast_to(
        @chat,
        render_to_string(partial: "messages/message", locals: { message: @message })
        )
      redirect_to chat_path(@chat, anchor: "message-#{@message.id}")
    else
      render "chat/show"
    end
  end

  private

  def message_params
    params.require(:message).permit(:content)
  end
end
