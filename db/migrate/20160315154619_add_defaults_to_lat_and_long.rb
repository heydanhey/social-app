class AddDefaultsToLatAndLong < ActiveRecord::Migration
  def change
    change_column :users, :latitude, :float, default: 0
    change_column :users, :longitude, :float, default: 0
  end
end
