require "test_helper"

class AdminUser::RecipesControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get admin_user_recipes_new_url
    assert_response :success
  end

  test "should get index" do
    get admin_user_recipes_index_url
    assert_response :success
  end

  test "should get show" do
    get admin_user_recipes_show_url
    assert_response :success
  end

  test "should get edit" do
    get admin_user_recipes_edit_url
    assert_response :success
  end
end
