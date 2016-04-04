class Api::V1::PostsController < ApplicationController

  def index
    @posts = Post.where(user_id: current_user.id).reverse_order

    @posts = @posts.select(:id, :user_id).select(:text, :emotion_id).distinct

    @stats = {}
    
    @posts.each do |post|
      @stats[post.id] = [post.get_percentage(1), post.get_percentage(2), post.get_percentage(3), post.get_percentage(4)]
    end
  end

  # def create
  #   @post = Post.new(name: params[:name], text: params[:text], emotion_id: params[:emotion_id])

  #   if @post.save
  #     render :show
  #   else
  #     render json: { errors: @post.errors.full_messages }, status: 422
  #   end
  # end

  def show()
    @post = Post.find(params[:id])
    @stat_1 = @post.get_percentage(1)
    @stat_2 = @post.get_percentage(2)
    @stat_3 = @post.get_percentage(3)
    @stat_4 = @post.get_percentage(4)

    @weef_response = session[:weef_response]
    @weef = Weef.last

    if params[:excited]
      post_action(1)
    elsif params[:amused]
      post_action(2)
    elsif params[:sympathetic]
      post_action(3)
    elsif params[:annoyed]
      post_action(4)
    end

  end

  # def update
  #   @post = Post.find(params[:id])

  #   @post.update(name: params[:name], text: params[:text], emotion_id: params[:emotion_id])

  #   render :show    
  # end

  # def destroy
  #   @post = Post.find(params[:id])
  #   @post.destroy

  #   render json: { message: "Employee Destroyed" }
  # end

  def post_action(emotion)
    #number is representative of each emotion_id, 1=excited, 2=amused, 3=sympathetic, 4=annoyed
      session[:weef_response] = false
      if @post.emotion_id == emotion
        # double check to make sure a user isn't weacting to his own post
        if @post.user_id == current_user.id
          redirect_to "/api/v1/posts/#{Post.sample.id}.json"
        end
        # if the params match the post author's intended emotion, then a weaction is created with match=true
        this_weaction = Weaction.create(user_id: current_user.id, post_id: @post.id, emotion_id: emotion, match: 1)

        # Because match is true...Begin Weef check
        # Grab all matched weactions from the author of the post
        their_weactions = Weaction.where(user_id: @post.user_id).where(match: true)

        # Bucket variable for current weef
        weef = Weef.new
        
        # Iterate through their weactions to see if the current user wrote any of those posts...if so then create a weef 
        their_weactions.each do |weaction|

          if weaction.post
            if weaction.post.user_id == current_user.id
              session[:weef_response] = true
              weef.update(weaction_a_id: weaction.id, weaction_b_id: this_weaction.id)
            end
          end
        end
        # only save the most recent weef, hence, weef.save after the loop, this prevents multiple weefs being created with the same second-half weaction match  
        if weef.id != nil
          weef.save
        end
        # End Weef check

        # Since a new weef was created, lets go ahead and activate the weef chat room [start clock]
        Chat.create(weef_id: weef.id, text: "Welcome!")

      else
        # if the params did not match the post author's intended emotion, then a weaction is created with the default, match=false
        Weaction.create(user_id: current_user.id, post_id: @post.id, emotion_id: emotion)
      end

      # Assign a new random post
      # @post = Post.all.sample # Original Call to gather random post

      # This is where I pull in a random post from a selected location radius
      # If statement to check to make sure a nearby post exits?
      if (@post = Post.get_post_by_location(current_user)) != nil
        redirect_to "/api/v1/posts/#{@post.id}.json"
      else
        flash[:warning] = "No posts in your location radius, please broaden your search!"
        # If there's no posts within radius, redirect to user profile
        redirect_to "/users/#{current_user.id}"
        # render json: "no_posts_in_location_radius"
      end
    end  

end
