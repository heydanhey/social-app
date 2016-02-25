class Chat < ActiveRecord::Base
  belongs_to :weef
  belongs_to :user
end
