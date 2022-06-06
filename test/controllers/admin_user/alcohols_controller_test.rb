require "test_helper"

class AdminUser::AlcoholsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admin_user_alcohols_index_url
    assert_response :success
  end

  test "should get edit" do
    get admin_user_alcohols_edit_url
    assert_response :success
  end
end
