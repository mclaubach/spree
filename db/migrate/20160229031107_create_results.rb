class CreateResults < ActiveRecord::Migration
  def change
    create_table :results do |t|
      t.integer :user_id
      t.integer :event_id
      t.integer :bid_id
      t.boolean :correct

      t.timestamps null: false
    end

    add_index :results, :user_id
  end
end
