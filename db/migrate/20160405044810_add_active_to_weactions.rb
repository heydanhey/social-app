class AddActiveToWeactions < ActiveRecord::Migration
  def change
    add_column :weactions, :active, :boolean, default: true
  end
end
