require 'test_helper'

class DailiesControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get dailies_new_url
    assert_response :success
  end

end
