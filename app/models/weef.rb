class Weef < ActiveRecord::Base
  has_many :users, through: :weactions
  # belongs_to :weaction_id, class_name: Weaction, :foreign_key => :weaction_A_id
  # belongs_to :weaction_id, class_name: Weaction, :foreign_key => :weaction_B_id
  has_many :weactions
  # has_many :weactions, class_name: Weaction, :foreign_key => :weaction_B_id

  
end
