class ChallengesController < ApplicationController
  def index
    @category = Category.find(params[:category_id])
    @challenges = @category.challenges
  end

  def show
  end
end
