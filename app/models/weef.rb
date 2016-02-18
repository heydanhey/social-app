class Weef < ActiveRecord::Base
  has_many :users, through: :weactions
  # belongs_to :weaction_id, class_name: Weaction, :foreign_key => :weaction_A_id
  # belongs_to :weaction_id, class_name: Weaction, :foreign_key => :weaction_B_id
  has_many :weactions
  # has_many :weactions, class_name: Weaction, :foreign_key => :weaction_B_id

  def user_a
    User.find(Weaction.find(weaction_A_id).user_id)
  end

  def user_b
    User.find(Weaction.find(weaction_B_id).user_id)
  end

  def post_a
    Post.find(Weaction.find(weaction_A_id).post_id)
  end

  def post_b
    Post.find(Weaction.find(weaction_B_id).post_id)
  end

  def weefer(id)
    if user_a.id == id
      user_b
    else
      user_a
    end
  end

end
