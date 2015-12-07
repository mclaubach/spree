class AddWinnerToEvent < ActiveRecord::Migration
  def change
    remove_column :events, :winner

    add_reference :events, :winner
  end
end
