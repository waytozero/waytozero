require 'test_helper'

class AchievementCategoriesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get achievement_categories_index_url
    assert_response :success
  end

end
