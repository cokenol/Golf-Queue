require "test_helper"

class GolfRangesControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get golf_ranges_show_url
    assert_response :success
  end
end
