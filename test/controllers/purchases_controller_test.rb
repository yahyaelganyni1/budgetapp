require "test_helper"

class PurchasesControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get purchases_new_url
    assert_response :success
  end

  test "should get _form" do
    get purchases__form_url
    assert_response :success
  end
end
