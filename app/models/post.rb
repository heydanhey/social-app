
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

  def get_percentage(emotion_id)
    # frequencies = Hash.new
    weactions = Weaction.where(post_id: id)
    total_weactions = weactions.count
    number_of_emotions = weactions.where(emotion_id: emotion_id).count
    if number_of_emotions == 0
      return "0%"
    else
      percentage = '%.0f' % ((number_of_emotions.to_f / total_weactions.to_f) * 100.0)
      return "#{percentage.to_s}%"
    end

    # weactions.each do |weaction|
    #   frequencies[weaction.emotion_id] += 1
    # end 
  end
  
end
