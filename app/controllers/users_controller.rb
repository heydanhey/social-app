class UsersController < ApplicationController

  before_action :authenticate_user!

  def index
    # This action will be the User Post Arcive, where a user can see a list of all his posts
    @user = User.find(current_user.id)
    @image = "https://api.adorable.io/avatars/285/#{@user.name}.png"

    # This will be for sorting
    # if params[:sort_up]
    #   @posts = Post.order(:emotion_id)
    # end

    # if params[:sort_down]
    #   @posts = Post.order(emotion_id: :desc)
    # end
  end

  def show
    # This page will be the standard User Profile page
    @user = User.find(current_user.id)
    # If the user has no posts, he is directed to post and inaugural post [Might need to implement before action]
    if @user.posts.count == 0
      flash[:warning] == "Account not activated"
      redirect_to '/posts/new'
    end

    # Once per Session
    # Assign location coordinates (Using Faker for Now)
    # Reassign user name for current session
    unless session[:update_user]
      @user.name = Bazaar.object.titleize
      # coordinates = Geocoder.coordinates(Faker::Internet.ip_v4_address)
      coordinates = Geocoder.coordinates(request.remote_ip)
      # if Geocoder fails, assigns these fake coords
      if coordinates == nil
        coordinates = [41.9474, -87.7037]
      end
      
      @user.latitude = coordinates[0]
      @user.longitude = coordinates[1]
      session[:update_user] = true
      @user.save
    end
    # @image = Faker::Avatar.image(@user.name, "200x200")
    @image = "https://api.adorable.io/avatars/285/#{@user.name}.png"

  end

  def update
    @user = User.find(current_user.id)

    @user.update(location_radius: params[:location_radius])

    flash[:success] = "Your Radius is Set"
    redirect_to "/users/#{current_user.id}"
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
