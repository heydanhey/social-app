class PostsController < ApplicationController
  def index
    @posts = Post.where(user_id: current_user.id)
  end

  def new
  end

  def create
    # Assign location coordinates
    coordinates = Geocoder.coordinates(Faker::Internet.ip_v4_address)
    @post = Post.create({text: params[:text], user_id: current_user.id, emotion_id: params[:emotion_id], latitude: coordinates[0], longitude: coordinates[1]})

    flash[:success] = "Post Created"
    redirect_to "/users/#{current_user.id}"
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
    redirect_to "/posts"
  end  
end
