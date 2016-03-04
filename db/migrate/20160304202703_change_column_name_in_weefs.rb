class ChangeColumnNameInWeefs < ActiveRecord::Migration
  def change
    rename_column :weefs, :weaction_A_id, :weaction_a_id
    rename_column :weefs, :weaction_B_id, :weaction_b_id
  end
end
