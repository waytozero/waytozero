class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
  end

  def dashboard
    @user = current_user
    @weekly_challenges = @user.weekly_challenges
    @categories = Category.all
  end
end
