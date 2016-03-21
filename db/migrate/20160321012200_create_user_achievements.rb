class CreateUserAchievements < ActiveRecord::Migration
  def change
    create_table :user_achievements do |t|
      t.string  :name
      t.integer :quantity_condition
      t.string  :type_condition

      t.timestamps null: false
    end
  end
end
