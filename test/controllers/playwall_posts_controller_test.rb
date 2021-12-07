require "test_helper"

class PlaywallPostsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get playwall_posts_index_url
    assert_response :success
  end

  test "should get new" do
    get playwall_posts_new_url
    assert_response :success
  end

  test "should get create" do
    get playwall_posts_create_url
    assert_response :success
  end
end
