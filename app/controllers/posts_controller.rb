class PostsController < ApplicationController
  def index
    @posts = Post.where(user_id: current_user.id)
  end

  def new
  end

  def create
    @post = Post.create({text: params[:text], user_id: current_user.id, emotion_id: params[:emotion][:emotion_id]})

    flash[:success] = "Post Created"
    redirect_to "/posts"
  end

  def show
    @post = Post.find(params[:id])

    if params[:random_next]
      post = Post.all.sample
      redirect_to "/posts/#{post.id}"
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
