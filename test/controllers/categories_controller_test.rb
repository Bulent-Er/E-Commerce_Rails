require "test_helper"

class CategoriesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @category = categories(:one)
  end

  test "should get index" do
    get api_categories_url
    assert_response :success
  end

  test "should get new" do
    get new_api_category_url
    assert_response :success
  end

  test "should create category" do
    assert_difference("Category.count") do
      post api_categories_url, params: { category: { name: @category.name } }
    end

    assert_redirected_to api_category_url(Category.last)
  end

  test "should show category" do
    get api_category_url(@category)
    assert_response :success
  end

  test "should get edit" do
    get edit_api_category_url(@category)
    assert_response :success
  end

  test "should update category" do
    patch api_category_url(@category), params: { category: { name: @category.name } }
    assert_redirected_to api_category_url(@category)
  end

  test "should destroy category" do
    assert_difference("Category.count", -1) do
      delete api_category_url(@category)
    end

    assert_redirected_to api_categories_url
  end
end
