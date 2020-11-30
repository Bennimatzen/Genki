class ChatsController < ApplicationController
  def index
    @chats = Chat.all
  end
end
