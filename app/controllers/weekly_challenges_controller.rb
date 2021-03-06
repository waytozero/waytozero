class WeeklyChallengesController < ApplicationController


  def create
    @weekly_challenge = WeeklyChallenge.new
    challenge = Challenge.find(params[:format])
    @weekly_challenge.challenge = challenge
    @weekly_challenge.week = Date.today.cweek
    @weekly_challenge.year = Time.now.year
    if params[:done] == "true"
      @weekly_challenge.status_challenge = true
      @user = current_user
      @weekly_challenge.save
      @weekly_challenge.challenge.size == true ? xp = 50 : xp = 25
      @user.xp += xp
      @user.level += 1 while level_up?
      @user.save
    end

    @weekly_challenge.user = current_user
    @weekly_challenge.save
    achievement_number?
    achievement_category?
    redirect_to dashboard_path
  end

  def update

    @weekly_challenge = WeeklyChallenge.find(params[:id])
    @user = current_user
    @weekly_challenge.status_challenge = true
    @weekly_challenge.week = Date.today.cweek
    @weekly_challenge.year = Time.now.year
    @weekly_challenge.save
    @xp = 0
    @weekly_challenge.challenge.size == true ? @xp = 50 : @xp = 25
    @user.tree_count += 1 if @weekly_challenge.challenge.size == true
    @user.xp += @xp
    @user.level += 1 while level_up?
    @user.save
    @total_trees = tree_counter
    @total_plastic = plastic_counter
    @user_plastic = @user.plastic_count
    achievement_number?
    achievement_category?
    @max_xp = xp_counter
    # redirect_to dashboard_path
  end

  private

  def tree_counter
    @users = User.all
    @users.sum('tree_count')
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

  def weekly_challenges_params
    params.require(:weekly_challenge).permit(:status_challenge, :week, :year)
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

  def level_up?
    if @user.level.zero?
      @user.xp -= 25
      true
    elsif @user.level <= 9 && @user.xp >= 50
      @user.xp -= 50
      true
    elsif @user.level > 9 && @user.xp >= @user.level * 10
      @user.xp -= @user.level * 10
      true
    else
      false
    end
  end

  def achievement_number?
    size = WeeklyChallenge.where(user: @user, status_challenge: true).size
    case size
    when 1, 5, 10, 20, 30
      new_successnumber(size)
    end
  end

  def achievement_category?
    picked_category = @weekly_challenge.challenge.category
    total_number = picked_category.challenges.where(size: false).size # Right now the achievement is only on the SMALL challenges
    grouped_challenge = []
    WeeklyChallenge.where(user: @user, status_challenge: true).each do |challenge|
      grouped_challenge << challenge if challenge.challenge.category == picked_category
    end
    new_successcategory(picked_category) if total_number == grouped_challenge.size
  end

  def new_successnumber(number)
    new_success = Success.create!(user: @user, achievement: AchievementNumber.find_by(number: number)) unless Success.find_by(user: @user, achievement: AchievementNumber.find_by(number: number))
  end

  def new_successcategory(category)
    Success.create!(user: @user, achievement: AchievementCategory.find_by(category: category))
  end
end
