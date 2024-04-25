require "test_helper"

class UserCartProductsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get user_cart_products_index_url
    assert_response :success
  end
end
