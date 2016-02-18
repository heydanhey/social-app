class UsersController < ApplicationController

  def show
    @user = User.find(current_user.id)
    if @user.posts.count == 0
      flash[:warning] == "Account not activated"
      redirect_to '/posts/new'
    end

    if @user.name == nil
      @user.name = Bazaar.heroku
      @user.save
    end
  end

  def update
    @user = User.find(current_user.id)

    @user.update(location_radius: params[:location_radius])

    flash[:success] = "Your Radius is Set"
    render :show
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
