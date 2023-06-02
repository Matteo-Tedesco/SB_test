require "test_helper"

class SeatsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @seat = seats(:one)
  end

  test "should get index" do
    get seats_url
    assert_response :success
  end

  test "should get new" do
    get new_seat_url
    assert_response :success
  end

  test "should create seat" do
    assert_difference("Seat.count") do
      post seats_url, params: { seat: { dep_name: @seat.dep_name, end_date: @seat.end_date, position: @seat.position, space_id: @seat.space_id, space_name: @seat.space_name, start_date: @seat.start_date, state: @seat.state, typology: @seat.typology } }
    end

    assert_redirected_to seat_url(Seat.last)
  end

  test "should show seat" do
    get seat_url(@seat)
    assert_response :success
  end

  test "should get edit" do
    get edit_seat_url(@seat)
    assert_response :success
  end

  test "should update seat" do
    patch seat_url(@seat), params: { seat: { dep_name: @seat.dep_name, end_date: @seat.end_date, position: @seat.position, space_id: @seat.space_id, space_name: @seat.space_name, start_date: @seat.start_date, state: @seat.state, typology: @seat.typology } }
    assert_redirected_to seat_url(@seat)
  end

  test "should destroy seat" do
    assert_difference("Seat.count", -1) do
      delete seat_url(@seat)
    end

    assert_redirected_to seats_url
  end
end
