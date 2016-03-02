class CreateUserCounters < ActiveRecord::Migration
  def change
    create_table :user_counters do |t|
      t.integer :spree
      t.integer :wins
      t.integer :losses
      t.integer :total_bids
      t.integer :user_id
    end

    add_index :user_counters, :user_id, unique: true
  end
end
