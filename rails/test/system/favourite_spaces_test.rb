require "application_system_test_case"

class FavouriteSpacesTest < ApplicationSystemTestCase
  setup do
    @favourite_space = favourite_spaces(:one)
  end

  test "visiting the index" do
    visit favourite_spaces_url
    assert_selector "h1", text: "Favourite spaces"
  end

  test "should create favourite space" do
    visit favourite_spaces_url
    click_on "New favourite space"

    fill_in "Dep name", with: @favourite_space.dep_name
    fill_in "Department", with: @favourite_space.department_id
    fill_in "Email", with: @favourite_space.email
    fill_in "Space", with: @favourite_space.space_id
    fill_in "Space name", with: @favourite_space.space_name
    fill_in "Typology", with: @favourite_space.typology
    fill_in "User", with: @favourite_space.user_id
    click_on "Create Favourite space"

    assert_text "Favourite space was successfully created"
    click_on "Back"
  end

  test "should update Favourite space" do
    visit favourite_space_url(@favourite_space)
    click_on "Edit this favourite space", match: :first

    fill_in "Dep name", with: @favourite_space.dep_name
    fill_in "Department", with: @favourite_space.department_id
    fill_in "Email", with: @favourite_space.email
    fill_in "Space", with: @favourite_space.space_id
    fill_in "Space name", with: @favourite_space.space_name
    fill_in "Typology", with: @favourite_space.typology
    fill_in "User", with: @favourite_space.user_id
    click_on "Update Favourite space"

    assert_text "Favourite space was successfully updated"
    click_on "Back"
  end

  test "should destroy Favourite space" do
    visit favourite_space_url(@favourite_space)
    click_on "Destroy this favourite space", match: :first

    assert_text "Favourite space was successfully destroyed"
  end
end
