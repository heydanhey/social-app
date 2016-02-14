class Weaction < ActiveRecord::Base
  belongs_to :user
  belongs_to :post
  has_many :weefs
end
