class ChallengesController < ApplicationController
  def index
    @category = Category.find(params[:category_id])
    @user = current_user
    @challenges = @category.challenges
    @small_challenges = @challenges.where(size: false)
    @user_challenges = WeeklyChallenge.where(user: @user)
    @small_challenges_displayed = @small_challenges.where.not(weekly_challenges: @user_challenges)
  end

  def show
    @challenge = Challenge.find(params[:id])
  end

  def index_done
    @user = current_user

    @user_wchallenges_done = @user.weekly_challenges.where(status_challenge: true)
    # includes, ask Antoine or raise ticket later but it should display the challenges
    # done meaning all challenges, not only the weekly ones.
  end
end
