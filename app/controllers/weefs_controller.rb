class WeefsController < ApplicationController

  def index
    @weefs = current_user.weefs.all
    if Post.find(Weaction.find(@weefs[0].weaction_A_id).user_id) == current_user.id
      @weefer = User.find(Post.find(Weaction.find(@weefs[0].weaction_B_id).user_id))
    else
      @weefer = User.find(Post.find(Weaction.find(@weefs[0].weaction_A_id).user_id))
    end
  end

end
