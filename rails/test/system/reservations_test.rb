require "application_system_test_case"

class ReservationsTest < ApplicationSystemTestCase
  setup do
    @reservation = reservations(:one)
  end

  test "visiting the index" do
    visit reservations_url
    assert_selector "h1", text: "Reservations"
  end

  test "should create reservation" do
    visit reservations_url
    click_on "New reservation"

    fill_in "Dep name", with: @reservation.dep_name
    fill_in "Department", with: @reservation.department_id
    fill_in "Email", with: @reservation.email
    fill_in "End date", with: @reservation.end_date
    fill_in "Floor", with: @reservation.floor
    fill_in "Is sync", with: @reservation.is_sync
    fill_in "Seat", with: @reservation.seat_id
    fill_in "Seat num", with: @reservation.seat_num
    fill_in "Space", with: @reservation.space_id
    fill_in "Space name", with: @reservation.space_name
    fill_in "Start date", with: @reservation.start_date
    fill_in "State", with: @reservation.state
    fill_in "Typology", with: @reservation.typology
    fill_in "User", with: @reservation.user_id
    click_on "Create Reservation"

    assert_text "Reservation was successfully created"
    click_on "Back"
  end

  test "should update Reservation" do
    visit reservation_url(@reservation)
    click_on "Edit this reservation", match: :first

    fill_in "Dep name", with: @reservation.dep_name
    fill_in "Department", with: @reservation.department_id
    fill_in "Email", with: @reservation.email
    fill_in "End date", with: @reservation.end_date
    fill_in "Floor", with: @reservation.floor
    fill_in "Is sync", with: @reservation.is_sync
    fill_in "Seat", with: @reservation.seat_id
    fill_in "Seat num", with: @reservation.seat_num
    fill_in "Space", with: @reservation.space_id
    fill_in "Space name", with: @reservation.space_name
    fill_in "Start date", with: @reservation.start_date
    fill_in "State", with: @reservation.state
    fill_in "Typology", with: @reservation.typology
    fill_in "User", with: @reservation.user_id
    click_on "Update Reservation"

    assert_text "Reservation was successfully updated"
    click_on "Back"
  end

  test "should destroy Reservation" do
    visit reservation_url(@reservation)
    click_on "Destroy this reservation", match: :first

    assert_text "Reservation was successfully destroyed"
  end
end
