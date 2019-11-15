class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
  end

  def dashboard
    @user = current_user
    @weekly_challenges = @user.weekly_challenges
    @categories = Category.all
    @total_trees = tree_counter
    @max_xp = xp_counter
    @total_plastic = plastic_counter
    @user_plastic = plastic_user
  end

  private

  def tree_counter
    @users = User.all
    @users.sum('tree_count')
  end

  def xp_counter
    if @user.level.zero?
      25
    elsif @user.level <= 9
      50
    else
      @user.level * 10
    end
  end

  def plastic_counter
    challenges_done = WeeklyChallenge.all.where(status_challenge: true)
    plastic_count = 0
    challenges_done.each do |challenge|
      challenge_found = challenge.challenge
      plastic_count += challenge_found.plastic
    end
    plastic_count
  end

  def plastic_user
    challenges_user = WeeklyChallenge.where(user: @user).where(status_challenge: true)
    plastic_count = 0
    challenges_user.each do |challenge|
      challenge_found = challenge.challenge
      plastic_count += challenge_found.plastic
    end
    plastic_count
  end
end
