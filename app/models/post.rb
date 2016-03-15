
class Post < ActiveRecord::Base
  belongs_to :user
  belongs_to :emotion
  has_many :weactions

  validates :text, presence: true
  validates :emotion_id, presence: true

  reverse_geocoded_by :latitude, :longitude

  def friendly_post_time
    created_at.strftime("%A, %b %d")
  end

  def self.get_post_by_location(user)
    post = Post.near([user.latitude, user.longitude], user.location_radius).sample
    # this while loop just prevents the current user being fed his own posts, thus you can not weef with yourself
    if post != nil
      while post.user_id == user.id
        post = Post.get_post_by_location(user)
      end
    else
      post = Post.first
    end
    return post
  end

  def get_percentage(emotion_id)
    weactions = Weaction.where(post_id: id)
    total_weactions = weactions.count
    number_of_emotions = weactions.where(emotion_id: emotion_id).count
    
    if number_of_emotions == 0
      return 0
    else
      percentage = '%.0f' % ((number_of_emotions.to_f / total_weactions.to_f) * 100.0)
      return percentage
    end
  end
  
end
 