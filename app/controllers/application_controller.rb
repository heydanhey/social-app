class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

    def post_action(emotion) #number is representative of each emotion_id, 1=excited, 2=amused, 3=sympathetic, 4=annoyed

      if @post.emotion_id == emotion
        Weaction.create(user_id: current_user.id, post_id: @post.id, emotion_id: emotion, match: 1)

        # Begin Weef check
        weactions = Weaction.where(user_id: @post.user_id).where(match: true)
        weactions.each do |weaction|
          if weaction.post.user_id == current_user.id
            flash[:success] = "You Weef'd!"
            Weef.create(weaction_A_id: @post.user_id, weaction_B_id: current_user.id)
          end
        end
        # End Weef check

      else
        Weaction.create(user_id: current_user.id, post_id: @post.id, emotion_id: emotion)
      end
    end


end
