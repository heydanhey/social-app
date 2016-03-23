class Weef < ActiveRecord::Base
  has_many :users, through: :weactions
  # belongs_to :weaction_id, class_name: Weaction, :foreign_key => :weaction_A_id
  # belongs_to :weaction_id, class_name: Weaction, :foreign_key => :weaction_B_id
  has_many :weactions
  has_many :chats
  # has_many :weactions, class_name: Weaction, :foreign_key => :weaction_B_id

  def user_a
    User.find(Weaction.find(weaction_a_id).user_id)
  end

  def user_b
    User.find(Weaction.find(weaction_b_id).user_id)
  end

  def post_a
    Post.find(Weaction.find(weaction_a_id).post_id)
  end

  def post_b
    Post.find(Weaction.find(weaction_b_id).post_id)
  end

  def weefer(id)
    if user_a.id == id
      user_b
    else
      user_a
    end
  end

  def my_post(id)
    if post_a.user_id == id
      post_a
    else
      post_b
    end
  end

  def their_post(id)
    if post_a.user_id == id
      post_b
    else
      post_a
    end
  end

  def time_left
    (created_at + 24.hours)-Time.now
  end

  def expiration
    t = ((created_at - 7.hours) + 24.hours)
    Time.at(t).utc.strftime("%A, %B %e, %Y %l:%m %p ")
  end

  def time_left_display
    t = (created_at + 24.hours)-Time.now
    Time.at(t).utc.strftime("%H:%M:%S")
  end


end
