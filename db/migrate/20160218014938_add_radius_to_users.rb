class AddRadiusToUsers < ActiveRecord::Migration
  def change
    add_column :users, :location_radius, :integer, default: 2000
  end
end
