class AddActiveToWeef < ActiveRecord::Migration
  def change
    add_column :weefs, :active, :boolean, default: true
  end
end
