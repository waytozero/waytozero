class ChangeMapInChallenges < ActiveRecord::Migration[5.2]
  def change
    change_column_default :challenges, :map, false
    change_column_default :challenges, :gender_specific, 0
  end
end
