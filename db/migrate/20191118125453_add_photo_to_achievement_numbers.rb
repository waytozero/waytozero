class AddPhotoToAchievementNumbers < ActiveRecord::Migration[5.2]
  def change
    add_column :achievement_numbers, :photo, :string
  end
end
