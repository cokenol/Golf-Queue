require "test_helper"

class StatusUpdatesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get status_updates_index_url
    assert_response :success
  end

  test "should get create" do
    get status_updates_create_url
    assert_response :success
  end

  test "should get new" do
    get status_updates_new_url
    assert_response :success
  end

  test "should get show" do
    get status_updates_show_url
    assert_response :success
  end

  test "should get edit" do
    get status_updates_edit_url
    assert_response :success
  end

  test "should get update" do
    get status_updates_update_url
    assert_response :success
  end

  test "should get delete" do
    get status_updates_delete_url
    assert_response :success
  end
end
