class ChallengesController < ApplicationController
  def index
    @category = Category.find(params[:category_id])
    @challenges = @category.challenges
    @small_challenges = @challenges.where(size: false)
  end

  def show
    @challenge = Challenge.find(params[:id])
  end
end
