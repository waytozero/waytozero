class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user!

  private

  def check_permission(record)
    redirect_to root_path unless record.user == current_user
  end
end
