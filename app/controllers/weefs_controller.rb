class WeefsController < ApplicationController

  def index
    @weefs = current_user.weefs.all
  end

end
