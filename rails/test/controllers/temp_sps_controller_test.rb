require "test_helper"

class TempSpsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @temp_sp = temp_sps(:one)
  end

  test "should get index" do
    get temp_sps_url
    assert_response :success
  end

  test "should get new" do
    get new_temp_sp_url
    assert_response :success
  end

  test "should create temp_sp" do
    assert_difference("TempSp.count") do
      post temp_sps_url, params: { temp_sp: { dep_name: @temp_sp.dep_name, description: @temp_sp.description, floor: @temp_sp.floor, name: @temp_sp.name, number_of_seats: @temp_sp.number_of_seats, state: @temp_sp.state, temp_dep_id: @temp_sp.temp_dep_id, typology: @temp_sp.typology } }
    end

    assert_redirected_to temp_sp_url(TempSp.last)
  end

  test "should show temp_sp" do
    get temp_sp_url(@temp_sp)
    assert_response :success
  end

  test "should get edit" do
    get edit_temp_sp_url(@temp_sp)
    assert_response :success
  end

  test "should update temp_sp" do
    patch temp_sp_url(@temp_sp), params: { temp_sp: { dep_name: @temp_sp.dep_name, description: @temp_sp.description, floor: @temp_sp.floor, name: @temp_sp.name, number_of_seats: @temp_sp.number_of_seats, state: @temp_sp.state, temp_dep_id: @temp_sp.temp_dep_id, typology: @temp_sp.typology } }
    assert_redirected_to temp_sp_url(@temp_sp)
  end

  test "should destroy temp_sp" do
    assert_difference("TempSp.count", -1) do
      delete temp_sp_url(@temp_sp)
    end

    assert_redirected_to temp_sps_url
  end
end
