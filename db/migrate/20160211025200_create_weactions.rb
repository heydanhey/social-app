class CreateWeactions < ActiveRecord::Migration
  def change
    create_table :weactions do |t|
      t.integer :user_id
      t.integer :post_id
      t.integer :emotion_id
      t.boolean :match, default: false

      t.timestamps null: false
    end
  end
end
