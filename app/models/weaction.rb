class Weaction < ActiveRecord::Base
  belongs_to :user
  belongs_to :post
  has_many :weefs, class_name: Weef, :foreign_key => :weaction_a_id
  has_many :weefs, class_name: Weef, :foreign_key => :weaction_b_id

end
