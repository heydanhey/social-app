class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :weef_count



    def weef_count
      if user_signed_in?

        # This call isn't currently working on herku because of case sensitivy in postgrql to column names
        all_weefs = Weef.joins("INNER JOIN weactions ON weefs.weaction_a_id=weactions.id OR weefs.weaction_b_id=weactions.id WHERE weactions.user_id=#{current_user.id}")
        
        # all_weefs = current_user.weefs.all
        weefs = []
        all_weefs.each do |weef|
          unless weef.time_left <= 0
            weefs << weef
          end
        end
      
        @weef_count = weefs.length
      end
    end

end

