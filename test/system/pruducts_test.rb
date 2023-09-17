require "application_system_test_case"

class PruductsTest < ApplicationSystemTestCase
  setup do
    @pruduct = pruducts(:one)
  end

  test "visiting the index" do
    visit pruducts_url
    assert_selector "h1", text: "Pruducts"
  end

  test "should create pruduct" do
    visit pruducts_url
    click_on "New pruduct"

    fill_in "Description", with: @pruduct.description
    fill_in "Name", with: @pruduct.name
    fill_in "Price", with: @pruduct.price
    fill_in "Quantity", with: @pruduct.quantity
    click_on "Create Pruduct"

    assert_text "Pruduct was successfully created"
    click_on "Back"
  end

  test "should update Pruduct" do
    visit pruduct_url(@pruduct)
    click_on "Edit this pruduct", match: :first

    fill_in "Description", with: @pruduct.description
    fill_in "Name", with: @pruduct.name
    fill_in "Price", with: @pruduct.price
    fill_in "Quantity", with: @pruduct.quantity
    click_on "Update Pruduct"

    assert_text "Pruduct was successfully updated"
    click_on "Back"
  end

  test "should destroy Pruduct" do
    visit pruduct_url(@pruduct)
    click_on "Destroy this pruduct", match: :first

    assert_text "Pruduct was successfully destroyed"
  end
end
