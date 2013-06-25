class CreateDoors < ActiveRecord::Migration
  def change
    create_table :doors do |t|
      t.integer :doorkey_id
      t.string :doorname

      t.timestamps
    end
  end
end
