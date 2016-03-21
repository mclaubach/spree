class CreateAchievements < ActiveRecord::Migration
  def change
    create_table :achievements do |t|
      t.integer  :user_achievement_id
      t.integer  :user_id

      t.timestamps null: false
    end
  end
end
