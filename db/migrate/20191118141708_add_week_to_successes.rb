class AddWeekToSuccesses < ActiveRecord::Migration[5.2]
  def change
    add_column :successes, :week, :integer
    add_column :successes, :year, :integer
  end
end
