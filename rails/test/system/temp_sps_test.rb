require "application_system_test_case"

class TempSpsTest < ApplicationSystemTestCase
  setup do
    @temp_sp = temp_sps(:one)
  end

  test "visiting the index" do
    visit temp_sps_url
    assert_selector "h1", text: "Temp sps"
  end

  test "should create temp sp" do
    visit temp_sps_url
    click_on "New temp sp"

    fill_in "Dep name", with: @temp_sp.dep_name
    fill_in "Description", with: @temp_sp.description
    fill_in "Floor", with: @temp_sp.floor
    fill_in "Name", with: @temp_sp.name
    fill_in "Number of seats", with: @temp_sp.number_of_seats
    fill_in "State", with: @temp_sp.state
    fill_in "Temp dep", with: @temp_sp.temp_dep_id
    fill_in "Typology", with: @temp_sp.typology
    click_on "Create Temp sp"

    assert_text "Temp sp was successfully created"
    click_on "Back"
  end

  test "should update Temp sp" do
    visit temp_sp_url(@temp_sp)
    click_on "Edit this temp sp", match: :first

    fill_in "Dep name", with: @temp_sp.dep_name
    fill_in "Description", with: @temp_sp.description
    fill_in "Floor", with: @temp_sp.floor
    fill_in "Name", with: @temp_sp.name
    fill_in "Number of seats", with: @temp_sp.number_of_seats
    fill_in "State", with: @temp_sp.state
    fill_in "Temp dep", with: @temp_sp.temp_dep_id
    fill_in "Typology", with: @temp_sp.typology
    click_on "Update Temp sp"

    assert_text "Temp sp was successfully updated"
    click_on "Back"
  end

  test "should destroy Temp sp" do
    visit temp_sp_url(@temp_sp)
    click_on "Destroy this temp sp", match: :first

    assert_text "Temp sp was successfully destroyed"
  end
end
