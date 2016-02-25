class ChatsController < ApplicationController

  def show

    @chats = Chat.where(weef_id: params[:id])

  end

  def create

    @chat = Chat.create(weef_id: params[:id], user_id: current_user.id, text: params[:text])

    redirect_to "/chats/#{@chat.weef_id}"

  end

end
