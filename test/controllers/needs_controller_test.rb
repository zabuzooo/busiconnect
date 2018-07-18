require 'test_helper'

class NeedsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get needs_new_url
    assert_response :success
  end

  test "should get index" do
    get needs_index_url
    assert_response :success
  end

  test "should get show" do
    get needs_show_url
    assert_response :success
  end

  test "should get edit" do
    get needs_edit_url
    assert_response :success
  end

  test "should get search" do
    get needs_search_url
    assert_response :success
  end

  test "should get top" do
    get needs_top_url
    assert_response :success
  end

end
