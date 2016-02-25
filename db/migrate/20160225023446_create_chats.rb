class CreateChats < ActiveRecord::Migration
  def change
    create_table :chats do |t|
      t.integer :weef_id
      t.integer :user_id
      t.string :text

      t.timestamps null: false
    end
  end
end
