class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :weef_count

    def post_action(emotion)
    #number is representative of each emotion_id, 1=excited, 2=amused, 3=sympathetic, 4=annoyed

      if @post.emotion_id == emotion
        # if the params match the post author's intended emotion, then a weaction is created with match=true
        this_weaction = Weaction.create(user_id: current_user.id, post_id: @post.id, emotion_id: emotion, match: 1)

        # Begin Weef check
        # Grab all matched weactions from the author of the post
        their_weactions = Weaction.where(user_id: @post.user_id).where(match: true)

        weef = Weef.new
        # Iterate through their weactions to see if the current user wrote any of those posts...if so then create a weef 
        their_weactions.each do |weaction|
          if weaction.post.user_id == current_user.id
            flash[:success] = "You Weef'd!"
            weef.update(weaction_A_id: weaction.id, weaction_B_id: this_weaction.id)
          end
        end
        # only save the most recent weef, hence, weef.save after the loop, this prevents multiple weefs being created with the same second-half weaction match  
        if weef.id != nil
          weef.save
        end
        # End Weef check

      else
        # if the params did not match the post author's intended emotion, then a weaction is created with the default, match=false
        Weaction.create(user_id: current_user.id, post_id: @post.id, emotion_id: emotion)
      end

      # Assign a new random post
      # @post = Post.all.sample # Original Call to gather random post

      # This is where I pull in a random post from a selected location radius
      # If statement to check to make sure a nearby post exits?
      if (@post = Post.get_post_by_location(current_user)) != nil
        # this while loop just prevents the current user being fed his own posts, thus you can not weef with yourself
        while @post.user_id == current_user.id
          @post = Post.get_post_by_location(current_user)
        end
        redirect_to "/posts/#{@post.id}"
      else
        flash[:warning] = "No posts in your location radius, please broaden your search!"
        # If there's no posts within radius, redirect to user profile
        redirect_to "/users/#{current_user.id}"
      end
    end

    def weef_count
      if user_signed_in?
          @weef_count = current_user.weefs.count
      end
    end

end
