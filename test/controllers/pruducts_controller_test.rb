require "test_helper"

class PruductsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @pruduct = pruducts(:one)
  end

  test "should get index" do
    get pruducts_url
    assert_response :success
  end

  test "should get new" do
    get new_pruduct_url
    assert_response :success
  end

  test "should create pruduct" do
    assert_difference("Pruduct.count") do
      post pruducts_url, params: { pruduct: { description: @pruduct.description, name: @pruduct.name, price: @pruduct.price, quantity: @pruduct.quantity } }
    end

    assert_redirected_to pruduct_url(Pruduct.last)
  end

  test "should show pruduct" do
    get pruduct_url(@pruduct)
    assert_response :success
  end

  test "should get edit" do
    get edit_pruduct_url(@pruduct)
    assert_response :success
  end

  test "should update pruduct" do
    patch pruduct_url(@pruduct), params: { pruduct: { description: @pruduct.description, name: @pruduct.name, price: @pruduct.price, quantity: @pruduct.quantity } }
    assert_redirected_to pruduct_url(@pruduct)
  end

  test "should destroy pruduct" do
    assert_difference("Pruduct.count", -1) do
      delete pruduct_url(@pruduct)
    end

    assert_redirected_to pruducts_url
  end
end
