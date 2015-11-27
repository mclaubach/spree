class AddColumnsToBids < ActiveRecord::Migration
  def change
    add_column :bids, :eventid, :integer
    add_column :bids, :user_choice, :integer
    add_column :bids, :correct, :boolean
  end
end
