require "application_system_test_case"

class TempDepsTest < ApplicationSystemTestCase
  setup do
    @temp_dep = temp_deps(:one)
  end

  test "visiting the index" do
    visit temp_deps_url
    assert_selector "h1", text: "Temp deps"
  end

  test "should create temp dep" do
    visit temp_deps_url
    click_on "New temp dep"

    fill_in "Cap", with: @temp_dep.cap
    fill_in "Citta", with: @temp_dep.citta
    fill_in "Civico", with: @temp_dep.civico
    fill_in "Dep event", with: @temp_dep.dep_event
    fill_in "Dep map", with: @temp_dep.dep_map
    fill_in "Description", with: @temp_dep.description
    fill_in "Floors", with: @temp_dep.floors
    fill_in "Lat", with: @temp_dep.lat
    fill_in "Lon", with: @temp_dep.lon
    fill_in "Manager", with: @temp_dep.manager
    fill_in "Name", with: @temp_dep.name
    fill_in "Number of spaces", with: @temp_dep.number_of_spaces
    fill_in "Provincia", with: @temp_dep.provincia
    fill_in "User", with: @temp_dep.user_id
    fill_in "Via", with: @temp_dep.via
    click_on "Create Temp dep"

    assert_text "Temp dep was successfully created"
    click_on "Back"
  end

  test "should update Temp dep" do
    visit temp_dep_url(@temp_dep)
    click_on "Edit this temp dep", match: :first

    fill_in "Cap", with: @temp_dep.cap
    fill_in "Citta", with: @temp_dep.citta
    fill_in "Civico", with: @temp_dep.civico
    fill_in "Dep event", with: @temp_dep.dep_event
    fill_in "Dep map", with: @temp_dep.dep_map
    fill_in "Description", with: @temp_dep.description
    fill_in "Floors", with: @temp_dep.floors
    fill_in "Lat", with: @temp_dep.lat
    fill_in "Lon", with: @temp_dep.lon
    fill_in "Manager", with: @temp_dep.manager
    fill_in "Name", with: @temp_dep.name
    fill_in "Number of spaces", with: @temp_dep.number_of_spaces
    fill_in "Provincia", with: @temp_dep.provincia
    fill_in "User", with: @temp_dep.user_id
    fill_in "Via", with: @temp_dep.via
    click_on "Update Temp dep"

    assert_text "Temp dep was successfully updated"
    click_on "Back"
  end

  test "should destroy Temp dep" do
    visit temp_dep_url(@temp_dep)
    click_on "Destroy this temp dep", match: :first

    assert_text "Temp dep was successfully destroyed"
  end
end
