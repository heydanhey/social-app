
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


    all_weefs = Weef.joins("INNER JOIN weactions ON weefs.weaction_a_id=weactions.id OR weefs.weaction_b_id=weactions.id WHERE weactions.user_id=#{user.id}")


    # collect all the users ids of people you may be currently weef'd with
    weefers = []
    all_weefs.each do |weef|
      if weef.active == true
        weefers << Weaction.find(weef.weaction_a_id).user_id
        weefers << Weaction.find(weef.weaction_b_id).user_id
      end
    end


    if post != nil
      weefers.each do |weefer|
    # this while loop just prevents the current user being fed his own posts, thus you can not weef with yourself
    # also a check to being fed a post from someone you already weef'd with
        while (post.user_id == user.id) || (post.user_id == weefer)
          post = Post.get_post_by_location(user)
        end
      end
    else
      post = Post.sample
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
 