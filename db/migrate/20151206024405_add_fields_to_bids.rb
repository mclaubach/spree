class AddFieldsToBids < ActiveRecord::Migration
  def change
    remove_column :bids, :user_choice

    add_reference :bids, :choice
  end
end
