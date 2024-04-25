require "test_helper"

class CartProductsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get cart_products_index_url
    assert_response :success
  end

  test "should get show" do
    get cart_products_show_url
    assert_response :success
  end
end
