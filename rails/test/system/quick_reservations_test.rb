require "application_system_test_case"

class QuickReservationsTest < ApplicationSystemTestCase
  setup do
    @quick_reservation = quick_reservations(:one)
  end

  test "visiting the index" do
    visit quick_reservations_url
    assert_selector "h1", text: "Quick reservations"
  end

  test "should create quick reservation" do
    visit quick_reservations_url
    click_on "New quick reservation"

    fill_in "Dep name", with: @quick_reservation.dep_name
    fill_in "Department", with: @quick_reservation.department_id
    fill_in "Email", with: @quick_reservation.email
    fill_in "Space", with: @quick_reservation.space_id
    fill_in "Space name", with: @quick_reservation.space_name
    fill_in "Typology", with: @quick_reservation.typology
    fill_in "User", with: @quick_reservation.user_id
    click_on "Create Quick reservation"

    assert_text "Quick reservation was successfully created"
    click_on "Back"
  end

  test "should update Quick reservation" do
    visit quick_reservation_url(@quick_reservation)
    click_on "Edit this quick reservation", match: :first

    fill_in "Dep name", with: @quick_reservation.dep_name
    fill_in "Department", with: @quick_reservation.department_id
    fill_in "Email", with: @quick_reservation.email
    fill_in "Space", with: @quick_reservation.space_id
    fill_in "Space name", with: @quick_reservation.space_name
    fill_in "Typology", with: @quick_reservation.typology
    fill_in "User", with: @quick_reservation.user_id
    click_on "Update Quick reservation"

    assert_text "Quick reservation was successfully updated"
    click_on "Back"
  end

  test "should destroy Quick reservation" do
    visit quick_reservation_url(@quick_reservation)
    click_on "Destroy this quick reservation", match: :first

    assert_text "Quick reservation was successfully destroyed"
  end
end
