class AddDefaultValueToUserCounters < ActiveRecord::Migration
  def change
    change_column :user_counters, :spree, :integer, :default => 0
    change_column :user_counters, :wins, :integer, :default => 0
    change_column :user_counters, :losses, :integer, :default => 0
    change_column :user_counters, :total_bids, :integer, :default => 0
  end
end
