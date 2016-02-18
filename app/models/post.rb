class Post < ActiveRecord::Base
  belongs_to :user
  belongs_to :emotion
  has_many :weactions

  reverse_geocoded_by :latitude, :longitude

  def friendly_post_time
    created_at.strftime("%m-%e-%y %H:%M")
  end

  def self.get_post_by_location(user)
    Post.near([user.latitude, user.longitude], user.location_radius).sample
  end
  
end
