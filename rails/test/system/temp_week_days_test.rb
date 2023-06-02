require "application_system_test_case"

class TempWeekDaysTest < ApplicationSystemTestCase
  setup do
    @temp_week_day = temp_week_days(:one)
  end

  test "visiting the index" do
    visit temp_week_days_url
    assert_selector "h1", text: "Temp week days"
  end

  test "should create temp week day" do
    visit temp_week_days_url
    click_on "New temp week day"

    fill_in "Apertura", with: @temp_week_day.apertura
    fill_in "Chiusura", with: @temp_week_day.chiusura
    fill_in "Day", with: @temp_week_day.day
    fill_in "Dep name", with: @temp_week_day.dep_name
    fill_in "State", with: @temp_week_day.state
    fill_in "Temp dep", with: @temp_week_day.temp_dep_id
    click_on "Create Temp week day"

    assert_text "Temp week day was successfully created"
    click_on "Back"
  end

  test "should update Temp week day" do
    visit temp_week_day_url(@temp_week_day)
    click_on "Edit this temp week day", match: :first

    fill_in "Apertura", with: @temp_week_day.apertura
    fill_in "Chiusura", with: @temp_week_day.chiusura
    fill_in "Day", with: @temp_week_day.day
    fill_in "Dep name", with: @temp_week_day.dep_name
    fill_in "State", with: @temp_week_day.state
    fill_in "Temp dep", with: @temp_week_day.temp_dep_id
    click_on "Update Temp week day"

    assert_text "Temp week day was successfully updated"
    click_on "Back"
  end

  test "should destroy Temp week day" do
    visit temp_week_day_url(@temp_week_day)
    click_on "Destroy this temp week day", match: :first

    assert_text "Temp week day was successfully destroyed"
  end
end
