class AddUserToWeeklyChallenges < ActiveRecord::Migration[5.2]
  def change
    add_reference :weekly_challenges, :user, foreign_key: true
  end
end
