require "test_helper"

class TempDepsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @temp_dep = temp_deps(:one)
  end

  test "should get index" do
    get temp_deps_url
    assert_response :success
  end

  test "should get new" do
    get new_temp_dep_url
    assert_response :success
  end

  test "should create temp_dep" do
    assert_difference("TempDep.count") do
      post temp_deps_url, params: { temp_dep: { cap: @temp_dep.cap, citta: @temp_dep.citta, civico: @temp_dep.civico, dep_event: @temp_dep.dep_event, dep_map: @temp_dep.dep_map, description: @temp_dep.description, floors: @temp_dep.floors, lat: @temp_dep.lat, lon: @temp_dep.lon, manager: @temp_dep.manager, name: @temp_dep.name, number_of_spaces: @temp_dep.number_of_spaces, provincia: @temp_dep.provincia, user_id: @temp_dep.user_id, via: @temp_dep.via } }
    end

    assert_redirected_to temp_dep_url(TempDep.last)
  end

  test "should show temp_dep" do
    get temp_dep_url(@temp_dep)
    assert_response :success
  end

  test "should get edit" do
    get edit_temp_dep_url(@temp_dep)
    assert_response :success
  end

  test "should update temp_dep" do
    patch temp_dep_url(@temp_dep), params: { temp_dep: { cap: @temp_dep.cap, citta: @temp_dep.citta, civico: @temp_dep.civico, dep_event: @temp_dep.dep_event, dep_map: @temp_dep.dep_map, description: @temp_dep.description, floors: @temp_dep.floors, lat: @temp_dep.lat, lon: @temp_dep.lon, manager: @temp_dep.manager, name: @temp_dep.name, number_of_spaces: @temp_dep.number_of_spaces, provincia: @temp_dep.provincia, user_id: @temp_dep.user_id, via: @temp_dep.via } }
    assert_redirected_to temp_dep_url(@temp_dep)
  end

  test "should destroy temp_dep" do
    assert_difference("TempDep.count", -1) do
      delete temp_dep_url(@temp_dep)
    end

    assert_redirected_to temp_deps_url
  end
end
