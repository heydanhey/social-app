class ChatsController < ApplicationController

  def show

    @chats = Chat.where(weef_id: params[:id])


    # Set read posts to served.
    @chats.each do |chat|
      if chat.user_id != current_user.id
        chat.update(served: true)
      end
    end
    
    gon.area_chart = [0,0,0,0]
    gon.profile_stats = [0]
  end

  def create

    @chat = Chat.create(weef_id: params[:id], user_id: current_user.id, text: params[:text])

    redirect_to "/chats/#{@chat.weef_id}"

  end

end
