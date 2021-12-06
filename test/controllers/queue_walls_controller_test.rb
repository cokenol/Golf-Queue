require "test_helper"

class QueueWallsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get queue_walls_index_url
    assert_response :success
  end

  test "should get new" do
    get queue_walls_new_url
    assert_response :success
  end

  test "should get create" do
    get queue_walls_create_url
    assert_response :success
  end
end
