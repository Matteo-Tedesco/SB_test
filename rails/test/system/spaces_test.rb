require "application_system_test_case"

class SpacesTest < ApplicationSystemTestCase
  setup do
    @space = spaces(:one)
  end

  test "visiting the index" do
    visit spaces_url
    assert_selector "h1", text: "Spaces"
  end

  test "should create space" do
    visit spaces_url
    click_on "New space"

    fill_in "Dep name", with: @space.dep_name
    fill_in "Department", with: @space.department_id
    fill_in "Description", with: @space.description
    fill_in "Floor", with: @space.floor
    fill_in "Name", with: @space.name
    fill_in "Number of seats", with: @space.number_of_seats
    fill_in "State", with: @space.state
    fill_in "Typology", with: @space.typology
    click_on "Create Space"

    assert_text "Space was successfully created"
    click_on "Back"
  end

  test "should update Space" do
    visit space_url(@space)
    click_on "Edit this space", match: :first

    fill_in "Dep name", with: @space.dep_name
    fill_in "Department", with: @space.department_id
    fill_in "Description", with: @space.description
    fill_in "Floor", with: @space.floor
    fill_in "Name", with: @space.name
    fill_in "Number of seats", with: @space.number_of_seats
    fill_in "State", with: @space.state
    fill_in "Typology", with: @space.typology
    click_on "Update Space"

    assert_text "Space was successfully updated"
    click_on "Back"
  end

  test "should destroy Space" do
    visit space_url(@space)
    click_on "Destroy this space", match: :first

    assert_text "Space was successfully destroyed"
  end
end
