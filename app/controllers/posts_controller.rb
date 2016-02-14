class PostsController < ApplicationController
  def index
    @posts = Post.where(user_id: current_user.id)
  end

  def new
  end

  def create
    @post = Post.create({text: params[:text], user_id: current_user.id, emotion_id: params[:emotion][:emotion_id]})

    flash[:success] = "Post Created"
    redirect_to "/users/#{current_user.id}"
  end

  def show
    @post = Post.find(params[:id])

    if params[:excited]

      post_action(1)
      
      post = Post.all.sample
      redirect_to "/posts/#{post.id}"
    end

    if params[:amused]
      
      post_action(2)

      post = Post.all.sample
      redirect_to "/posts/#{post.id}"
    end

    if params[:sympathetic]
      
      post_action(3)

      post = Post.all.sample
      redirect_to "/posts/#{post.id}"
    end

    if params[:annoyed]
      
      post_action(4)

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
