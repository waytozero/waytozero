class CreateWeeklyChallenges < ActiveRecord::Migration[5.2]
  def change
    create_table :weekly_challenges do |t|
      t.integer :week
      t.integer :year
      t.boolean :status_challenge
      t.references :challenge, foreign_key: true

      t.timestamps
    end
  end
end
