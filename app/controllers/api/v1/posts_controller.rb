class Api::V1::PostsController < ApplicationController

  def index
    @posts = Post.where(user_id: current_user.id)

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

  def show
    @post = Post.find(params[:id])
    gon.post = @post
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

end
