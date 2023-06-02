require "application_system_test_case"

class WeekDaysTest < ApplicationSystemTestCase
  setup do
    @week_day = week_days(:one)
  end

  test "visiting the index" do
    visit week_days_url
    assert_selector "h1", text: "Week days"
  end

  test "should create week day" do
    visit week_days_url
    click_on "New week day"

    fill_in "Apertura", with: @week_day.apertura
    fill_in "Chiusura", with: @week_day.chiusura
    fill_in "Day", with: @week_day.day
    fill_in "Dep name", with: @week_day.dep_name
    fill_in "Department", with: @week_day.department_id
    fill_in "State", with: @week_day.state
    click_on "Create Week day"

    assert_text "Week day was successfully created"
    click_on "Back"
  end

  test "should update Week day" do
    visit week_day_url(@week_day)
    click_on "Edit this week day", match: :first

    fill_in "Apertura", with: @week_day.apertura
    fill_in "Chiusura", with: @week_day.chiusura
    fill_in "Day", with: @week_day.day
    fill_in "Dep name", with: @week_day.dep_name
    fill_in "Department", with: @week_day.department_id
    fill_in "State", with: @week_day.state
    click_on "Update Week day"

    assert_text "Week day was successfully updated"
    click_on "Back"
  end

  test "should destroy Week day" do
    visit week_day_url(@week_day)
    click_on "Destroy this week day", match: :first

    assert_text "Week day was successfully destroyed"
  end
end
