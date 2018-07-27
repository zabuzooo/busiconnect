require 'test_helper'

class TypesControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get types_show_url
    assert_response :success
  end

end
