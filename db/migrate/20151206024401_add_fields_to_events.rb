class AddFieldsToEvents < ActiveRecord::Migration
  def change
    remove_column :events, :team1
    remove_column :events, :team2

    add_reference :events, :team1
    add_reference :events, :team2
  end
end
