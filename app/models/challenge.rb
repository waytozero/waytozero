class Challenge < ApplicationRecord
  belongs_to :category
  has_many :weekly_challenges
  has_many :user, through: :weekly_challenges
end
