class AddServedToChats < ActiveRecord::Migration
  def change
    add_column :chats, :served, :boolean, default: false
  end
end
