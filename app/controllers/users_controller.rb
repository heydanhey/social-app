class UsersController < ApplicationController

  def show
    @user = User.find(current_user.id)
    if @user.posts.count == 0
      flash[:warning] == "Account not activated"
      redirect_to '/posts/new'
    end

    # Once per Session
    # Assign location coordinates (Using Faker for Now)
    # Reassign user name for current session
    unless session[:update_user]
      @user.name = Bazaar.heroku
      coordinates = Geocoder.coordinates(Faker::Internet.ip_v4_address)
      @user.latitude = coordinates[0]
      @user.longitude = coordinates[1]
      session[:update_user] = true
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
    # I'm removing all the posts for now, but I probably want to just set them to inactive
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
