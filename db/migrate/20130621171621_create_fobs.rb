class CreateFobs < ActiveRecord::Migration
  def change
    create_table :fobs do |t|
      t.string :key
      t.integer :user_id

      t.timestamps
    end
  end
end
