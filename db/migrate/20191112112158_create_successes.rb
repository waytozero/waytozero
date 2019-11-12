class CreateSuccesses < ActiveRecord::Migration[5.2]
  def change
    create_table :successes do |t|
      t.references :achievement, polymorphic: true

      t.timestamps
    end
  end
end
