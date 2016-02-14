class UsersController < ApplicationController

  def show

    @user = User.find_by(id: current_user.id)

    if @user.name == nil
      @user.name = Bazaar.heroku
      @user.save
    end

  end
  
end
