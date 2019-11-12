class CreateAchievementNumbers < ActiveRecord::Migration[5.2]
  def change
    create_table :achievement_numbers do |t|
      t.string :name
      t.integer :number

      t.timestamps
    end
  end
end
