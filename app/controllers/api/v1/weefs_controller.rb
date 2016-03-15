class Api::V1::WeefsController < ApplicationController

  def show
    #@weef = Weef.find(params[:id])
    if params[:their_posts]
      @see_post = true
      @posts = Post.where(user_id: params[:id])
    elsif params[:their_weactions]
      @see_post = false
      @weactions = Weaction.where(user_id: params[:id]).limit(25)
    end
  end

end