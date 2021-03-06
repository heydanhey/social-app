class WeefsController < ApplicationController

  before_action :authenticate_user!

  def index
    # Get all weefs

    # This call isn't currently working on herku because of case sensitivy in postgrql to column names -  FIXED
    all_weefs = Weef.joins("INNER JOIN weactions ON weefs.weaction_a_id=weactions.id OR weefs.weaction_b_id=weactions.id WHERE weactions.user_id=#{current_user.id} ORDER BY weefs.created_at DESC") 
    # all_weefs = current_user.weefs.all
    # Check Active weefs
    @weefs = []
    all_weefs.each do |weef|
      unless weef.time_left <= 0
        @weefs << weef
      end
    end

    gon.area_chart = [0,0,0,0]
    gon.profile_stats = [0]

  end

  def show
    gon.id = params[:id]
    # @weef = Weef.find(params[:id])
    if params[:their_posts]

      @see_post = true

      @posts = Post.where(user_id: params[:id]).select(:id, :user_id).select(:text, :emotion_id).distinct.limit(25)

      # @posts = @posts.select(:id, :user_id).select(:text, :emotion_id).distinct

    elsif params[:their_weactions]

      @see_post = false

      @weactions = Weaction.where(user_id: params[:id]).limit(25)

    end
    
    gon.area_chart = [0,0,0,0]
    gon.profile_stats = [0]
  end
 
end
