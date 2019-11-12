class Category < ApplicationRecord
  has_many :challenges
  has_many :achievement_categories
end
