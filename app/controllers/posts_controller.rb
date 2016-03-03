class PostsController < ApplicationController

  before_action :authenticate_user!

  def index
    @posts = Post.where(user_id: current_user.id)
  end

  def new
    @post = Post.new
  end

  def create

    # Assign location coordinates
    coordinates = Geocoder.coordinates(Faker::Internet.ip_v4_address)
    # if Geocoder fails assigns these fake coords
    if coordinates == nil
      coordinates = [Faker::Address.latitude, Faker::Address.longitude]
    end

    @post = Post.new({text: params[:text], user_id: current_user.id, emotion_id: params[:emotion_id], latitude: coordinates[0], longitude: coordinates[1]})

    if @post.save
      flash[:success] = "Post Created, Start Weacting!!!!"
      redirect_to "/posts/#{Post.get_post_by_location(current_user).id}"
    else
      render :new
    end
  end

  def show
    @post = Post.find(params[:id])
    gon.post = @post

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

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])

    @post.update({text: params[:text], emotion_id: params[:emotion][:emotion_id]})

    flash[:success] = "Post Updated"
    redirect_to "/posts/#{@post.id}"
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to "/users"
  end

  def post_action(emotion)
    #number is representative of each emotion_id, 1=excited, 2=amused, 3=sympathetic, 4=annoyed

      if @post.emotion_id == emotion
        # double check to make sure a user isn't weactiong to his own post
        if @post.user_id == current_user.id
          redirect_to "/posts/#{Post.sample}"
        end
        # if the params match the post author's intended emotion, then a weaction is created with match=true
        this_weaction = Weaction.create(user_id: current_user.id, post_id: @post.id, emotion_id: emotion, match: 1)

        # Because match is true...Begin Weef check
        # Grab all matched weactions from the author of the post
        their_weactions = Weaction.where(user_id: @post.user_id).where(match: true)
        # Bucket vaiable for current weef
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
        redirect_to "/posts/#{@post.id}"
      else
        flash[:warning] = "No posts in your location radius, please broaden your search!"
        # If there's no posts within radius, redirect to user profile
        redirect_to "/users/#{current_user.id}"
      end
    end  
end
