class CreateWeefs < ActiveRecord::Migration
  def change
    create_table :weefs do |t|
      t.integer :weaction_A_id
      t.integer :weaction_B_id

      t.timestamps null: false
    end
  end
end
