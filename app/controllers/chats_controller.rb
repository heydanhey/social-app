class ChatsController < ApplicationController

  def show

    @chats = Chat.where(weef_id: params[:id])


    # Set read posts to served.
    @chats.each do |chat|
      if chat.user_id != current_user.id
        chat.update(served: true)
      end
    end
    
  end

  def create

    @chat = Chat.create(weef_id: params[:id], user_id: current_user.id, text: params[:text])

    redirect_to "/chats/#{@chat.weef_id}"

  end

end
