class RemoveEventFromTeam < ActiveRecord::Migration
  def change
    remove_column :teams, :event_id
  end
end
