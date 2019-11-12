require 'test_helper'

class SuccessesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get successes_index_url
    assert_response :success
  end

  test "should get update" do
    get successes_update_url
    assert_response :success
  end

  test "should get new" do
    get successes_new_url
    assert_response :success
  end

  test "should get create" do
    get successes_create_url
    assert_response :success
  end

end
