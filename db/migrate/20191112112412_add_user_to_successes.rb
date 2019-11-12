class AddUserToSuccesses < ActiveRecord::Migration[5.2]
  def change
    add_reference :successes, :user, foreign_key: true
  end
end
