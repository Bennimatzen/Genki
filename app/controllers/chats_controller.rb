class ChatsController < ApplicationController
  def index
    @chats = Chat.all
  end

  def show
    @chat = Chat.find(params[:id])
    @chat.messages.update_all(unread: false)
    # @chat.messages = Chat.find(params[:id]).order(:created_at)
    @message = Message.new
  end

  def create
    @user = current_user
    @doctor = Doctor.find(params[:doctor])
    @chat = Chat.new
    @chat.user = @user
    @chat.doctor = @doctor
    if @chat.save
      redirect_to chat_path(@chat)
    else
      flash[:notice] = "FATAL ERROR RIP"
      render "users/show"
    end
  end
end
