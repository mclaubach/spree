class CreateMatches < ActiveRecord::Migration
  def change
    create_table :matches do |t|
      t.string :uid
      t.string :winner
      t.datetime :started_at
      t.string :mode
      t.string :match_type
      t.string :duration

      t.timestamps null: false
    end
  end
end
