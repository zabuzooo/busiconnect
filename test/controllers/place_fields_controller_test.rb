require 'test_helper'

class PlaceFieldsControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get place_fields_show_url
    assert_response :success
  end

end
