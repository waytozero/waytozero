class ChallengesController < ApplicationController
  def index
    @category = Category.find(params[:id])
    @challenges = Challenge.find_by(category: @category)
  end

  def show
  end
end
