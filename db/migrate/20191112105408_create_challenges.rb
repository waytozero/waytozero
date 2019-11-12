class CreateChallenges < ActiveRecord::Migration[5.2]
  def change
    create_table :challenges do |t|
      t.string :name
      t.string :description
      t.integer :intensity
      t.boolean :map
      t.integer :gender_specific
      t.integer :plastic
      t.boolean :size

      t.timestamps
    end
  end
end
