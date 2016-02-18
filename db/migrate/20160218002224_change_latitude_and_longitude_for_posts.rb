class ChangeLatitudeAndLongitudeForPosts < ActiveRecord::Migration
  def change
    change_column :posts, :latitude, :float
    change_column :posts, :longitude, :float
  end
end
