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
    @successes = Success.where(user: @user)
    @all_challenges = Challenge.all
    # @challenges = @user.challenges
    @challenges = WeeklyChallenge.where(user: current_user)

    @hash_all_challenges = {}
    @hash_assigned_challenges = {}
    @hash_assigned_challenges_done = {}
    @categories.each do |category|
      @hash_all_challenges["#{category.name}"] = filtering_category(category.name)
      @hash_assigned_challenges["#{category.name}"] = filtering_category_assigned(category.name)
      @hash_assigned_challenges_done["#{category.name}"] = filtering_category_assigned_not_done(category.name)
    end
  end

  def journal
    @user = current_user
    @challenges = WeeklyChallenge.where(user: @user)
    @successes = Success.where(user: @user)
  end

  private

  def filtering_category_assigned(name)
    @challenges.select do |weekly_challenge|
      weekly_challenge.challenge.category.name == name
    end.count
  end

  def filtering_category_assigned_not_done(name)
    @challenges.select do |weekly_challenge|
      weekly_challenge.challenge.category.name == name && weekly_challenge.status_challenge == false
    end.count
  end

  def filtering_category(name)
    @all_challenges.select do |challenge|
      challenge.category.name == name && challenge.size == false
    end.count
  end

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
