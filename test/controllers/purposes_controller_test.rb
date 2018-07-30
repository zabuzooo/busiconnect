require 'test_helper'

class PurposesControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get purposes_show_url
    assert_response :success
  end

end
