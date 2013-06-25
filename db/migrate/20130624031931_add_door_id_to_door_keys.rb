class AddDoorIdToDoorKeys < ActiveRecord::Migration
  def change
    add_column :door_keys, :door_id, :integer
  end
end
