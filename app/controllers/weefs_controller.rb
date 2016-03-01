class WeefsController < ApplicationController

  def index
    # all_weefs = current_user.weefs.all
    # Get all weefs
    all_weefs = weefs = Weef.joins("INNER JOIN weactions ON weefs.weaction_A_id=weactions.id OR weefs.weaction_B_id=weactions.id WHERE weactions.user_id=10")
    # Check Active weefs
    @weefs = []
    all_weefs.each do |weef|
      unless weef.time_left <= 0
        @weefs << weef
      end
    end
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
