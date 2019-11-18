class AddPhotoToAchievementCategories < ActiveRecord::Migration[5.2]
  def change
    add_column :achievement_categories, :photo, :string
  end
end
