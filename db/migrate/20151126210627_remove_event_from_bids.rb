class RemoveEventFromBids < ActiveRecord::Migration
  def change
  	remove_column :bids, :eventid
  end
end
