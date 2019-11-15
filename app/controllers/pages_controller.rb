class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
  end

  def dashboard
    @user = current_user
    @weekly_challenges = @user.weekly_challenges
    @categories = Category.all
    if @user.level.zero?
      @max_xp = 25
    elsif @user.level <= 9
      @max_xp = 50
    else
      @max_xp = @user.level * 10
    end
  end
end
