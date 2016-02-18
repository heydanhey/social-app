class UsersController < ApplicationController

  def show
    @user = User.find_by(id: current_user.id)
    if @user.posts.count == 0
      flash[:warning] == "Account not activated"
      redirect_to '/posts/new'
    end

    if @user.name == nil
      @user.name = Bazaar.heroku
      @user.save
    end
  end

  def destroy
    @user = User.find(current_user.id)
    @posts = @user.posts
    @posts.destroy_all
    @user.destroy

    if @user.destroy
      flash[:success] == "User Deleted"
      redirect_to new_user_registration_path
    else
      flash[:warning] == "Account not deleted"
    end
  end
  
end
