class AddEventToBid < ActiveRecord::Migration
  def change
    add_reference :bids, :event, index: true, foreign_key: true
  end
end
