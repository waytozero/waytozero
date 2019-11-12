require 'test_helper'

class AchievementNumbersControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get achievement_numbers_index_url
    assert_response :success
  end

end
