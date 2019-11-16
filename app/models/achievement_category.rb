class AchievementCategory < ApplicationRecord
  include Achievement
  belongs_to :category
end
