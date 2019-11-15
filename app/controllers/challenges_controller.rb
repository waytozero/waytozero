class ChallengesController < ApplicationController
  def index
    @category = Category.find(params[:category_id])
    @user = current_user
    @challenges = @category.challenges
    @small_challenges = @challenges.where(size: false)
    @user_challenges = WeeklyChallenge.where(user: @user)
    @small_challenges_displayed = @small_challenges.where.not(weekly_challenges: @user_challenges)
    raise
  end

  def show
    @challenge = Challenge.find(params[:id])
  end
end
