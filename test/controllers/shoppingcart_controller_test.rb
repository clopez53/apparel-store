require 'test_helper'

class ShoppingcartControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get shoppingcart_show_url
    assert_response :success
  end

end
