class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :weekly_challenges
  has_many :challenges, through: :weekly_challenges

  def plastic_count
  challenges_user = weekly_challenges
    .where(status_challenge: true)
    .map(&:challenge)
    .sum(&:plastic)
  end
end
