require "test_helper"

class QuickReservationsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @quick_reservation = quick_reservations(:one)
  end

  test "should get index" do
    get quick_reservations_url
    assert_response :success
  end

  test "should get new" do
    get new_quick_reservation_url
    assert_response :success
  end

  test "should create quick_reservation" do
    assert_difference("QuickReservation.count") do
      post quick_reservations_url, params: { quick_reservation: { dep_name: @quick_reservation.dep_name, department_id: @quick_reservation.department_id, email: @quick_reservation.email, space_id: @quick_reservation.space_id, space_name: @quick_reservation.space_name, typology: @quick_reservation.typology, user_id: @quick_reservation.user_id } }
    end

    assert_redirected_to quick_reservation_url(QuickReservation.last)
  end

  test "should show quick_reservation" do
    get quick_reservation_url(@quick_reservation)
    assert_response :success
  end

  test "should get edit" do
    get edit_quick_reservation_url(@quick_reservation)
    assert_response :success
  end

  test "should update quick_reservation" do
    patch quick_reservation_url(@quick_reservation), params: { quick_reservation: { dep_name: @quick_reservation.dep_name, department_id: @quick_reservation.department_id, email: @quick_reservation.email, space_id: @quick_reservation.space_id, space_name: @quick_reservation.space_name, typology: @quick_reservation.typology, user_id: @quick_reservation.user_id } }
    assert_redirected_to quick_reservation_url(@quick_reservation)
  end

  test "should destroy quick_reservation" do
    assert_difference("QuickReservation.count", -1) do
      delete quick_reservation_url(@quick_reservation)
    end

    assert_redirected_to quick_reservations_url
  end
end
