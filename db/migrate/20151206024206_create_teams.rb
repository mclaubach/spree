class CreateTeams < ActiveRecord::Migration
  def change
    create_table :teams do |t|
      t.text :title
      t.references :event
    end
  end
end
