require 'test_helper'

class WeeklyChallengesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get weekly_challenges_index_url
    assert_response :success
  end

  test "should get create" do
    get weekly_challenges_create_url
    assert_response :success
  end

  test "should get update" do
    get weekly_challenges_update_url
    assert_response :success
  end

end
