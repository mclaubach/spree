class CreateEventsAndTeams < ActiveRecord::Migration
  def change
    remove_column :events, :team1_id
    remove_column :events, :team2_id

    create_table :events_teams do |t|
      t.belongs_to :event, index: true
      t.belongs_to :team, index: true
    end
  end
end
