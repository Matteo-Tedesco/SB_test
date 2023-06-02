require "application_system_test_case"

class DepartmentsTest < ApplicationSystemTestCase
  setup do
    @department = departments(:one)
  end

  test "visiting the index" do
    visit departments_url
    assert_selector "h1", text: "Departments"
  end

  test "should create department" do
    visit departments_url
    click_on "New department"

    fill_in "Cap", with: @department.cap
    fill_in "Citta", with: @department.citta
    fill_in "Civico", with: @department.civico
    fill_in "Dep event", with: @department.dep_event
    fill_in "Dep map", with: @department.dep_map
    fill_in "Description", with: @department.description
    fill_in "Floors", with: @department.floors
    fill_in "Latitude", with: @department.latitude
    fill_in "Longitude", with: @department.longitude
    fill_in "Manager", with: @department.manager
    fill_in "Name", with: @department.name
    fill_in "Number of spaces", with: @department.number_of_spaces
    fill_in "Provincia", with: @department.provincia
    fill_in "User", with: @department.user_id
    fill_in "Via", with: @department.via
    click_on "Create Department"

    assert_text "Department was successfully created"
    click_on "Back"
  end

  test "should update Department" do
    visit department_url(@department)
    click_on "Edit this department", match: :first

    fill_in "Cap", with: @department.cap
    fill_in "Citta", with: @department.citta
    fill_in "Civico", with: @department.civico
    fill_in "Dep event", with: @department.dep_event
    fill_in "Dep map", with: @department.dep_map
    fill_in "Description", with: @department.description
    fill_in "Floors", with: @department.floors
    fill_in "Latitude", with: @department.latitude
    fill_in "Longitude", with: @department.longitude
    fill_in "Manager", with: @department.manager
    fill_in "Name", with: @department.name
    fill_in "Number of spaces", with: @department.number_of_spaces
    fill_in "Provincia", with: @department.provincia
    fill_in "User", with: @department.user_id
    fill_in "Via", with: @department.via
    click_on "Update Department"

    assert_text "Department was successfully updated"
    click_on "Back"
  end

  test "should destroy Department" do
    visit department_url(@department)
    click_on "Destroy this department", match: :first

    assert_text "Department was successfully destroyed"
  end
end
