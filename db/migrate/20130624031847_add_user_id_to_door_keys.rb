class AddUserIdToDoorKeys < ActiveRecord::Migration
  def change
    add_column :door_keys, :user_id, :integer
  end
end
