class UsersController < ApplicationController

  before_action :authenticate_user!

  def index
    # This action will be the User Post Arcive, where a user can see a list of all his posts
    @user = User.find(current_user.id)

    gon.area_chart = [0,0,0,0]
    gon.profile_stats = [0]
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
    # Assign location coordinates
    # Reassign user name for current session
    # unless session[:update_user]
    #   @user.name = Bazaar.object.titleize
    #   # coordinates = Geocoder.coordinates(Faker::Internet.ip_v4_address)
    #   coordinates = Geocoder.coordinates(request.remote_ip)
    #   # if Geocoder fails, assigns these fake coords
    #   if coordinates == nil
    #     coordinates = [41.9474, -87.7037]
    #   end
      
    #   @user.latitude = coordinates[0]
    #   @user.longitude = coordinates[1]
    #   session[:update_user] = true
    #   @user.save
    #end
    
    total_num_weactions = @user.weactions.count

    @profile_stats = []

    @profile_stats << total_num_weactions

    @profile_stats << @user.weactions.where(emotion_id: 1).count
    @profile_stats << @user.weactions.where(emotion_id: 2).count
    @profile_stats << @user.weactions.where(emotion_id: 3).count
    @profile_stats << @user.weactions.where(emotion_id: 4).count
    gon.profile_stats = @profile_stats

    @profile_area_chart = []
    @profile_area_chart << @user.created_at

    [1,2,3,4].each do |number|

      date = @user.created_at.midnight
      weactions = @user.weactions.where(emotion_id: number)
      data_array = []

      if weactions.count != 0
        while date <= weactions.last.created_at.midnight
          data = 0
          weactions.each do |weaction|
            if weaction.created_at.midnight == date
              data += 1
            end
          end
          date = date + 1.day
          data_array << data
        end
      else 
        data_array << 0
      end
        

      @profile_area_chart << data_array
    end

    gon.area_chart = @profile_area_chart
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
