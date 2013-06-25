class CreateDoorKeys < ActiveRecord::Migration
  def change
    create_table :door_keys do |t|

      t.timestamps
    end
  end
end
