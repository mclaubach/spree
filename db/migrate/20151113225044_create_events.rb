class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.text :title
      t.datetime :time
      t.string :team1
      t.string :team2
      t.integer :winner
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
