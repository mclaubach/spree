class CreateShields < ActiveRecord::Migration
  def change
    create_table :shields do |t|
      t.integer :user_id
      t.integer :event_id
      t.integer :bid_id
      t.string  :type

      t.timestamps null: false
    end
  end
end
