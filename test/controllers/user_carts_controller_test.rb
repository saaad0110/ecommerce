require "test_helper"

class UserCartsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get user_carts_index_url
    assert_response :success
  end
end
