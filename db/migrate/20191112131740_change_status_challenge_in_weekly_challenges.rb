class ChangeStatusChallengeInWeeklyChallenges < ActiveRecord::Migration[5.2]
  def change
    change_column_default :weekly_challenges, :status_challenge, false
  end
end
