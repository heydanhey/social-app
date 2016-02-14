class Post < ActiveRecord::Base
  belongs_to :user
  belongs_to :emotion

  def friendly_post_time
    created_at.strftime("%m-%e-%y %H:%M")
  end

  
end
