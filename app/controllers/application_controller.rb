class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :weef_count

    def weef_count
      if user_signed_in?
          @weef_count = current_user.weefs.count
      end
    end

end
