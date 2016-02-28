class WeefsController < ApplicationController

  def index
    @weefs = current_user.weefs.all
  end

  def show
    #@weef = Weef.find(params[:id])
    if params[:their_posts]
      @see_post = true
      @posts = Post.where(user_id: params[:id])
    elsif params[:their_weactions]
      @see_post = false
      @weactions = Weaction.where(user_id: params[:id])
    end
  end

end
