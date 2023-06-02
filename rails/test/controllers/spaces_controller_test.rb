require "test_helper"

class SpacesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @space = spaces(:one)
  end

  test "should get index" do
    get spaces_url
    assert_response :success
  end

  test "should get new" do
    get new_space_url
    assert_response :success
  end

  test "should create space" do
    assert_difference("Space.count") do
      post spaces_url, params: { space: { dep_name: @space.dep_name, department_id: @space.department_id, description: @space.description, floor: @space.floor, name: @space.name, number_of_seats: @space.number_of_seats, state: @space.state, typology: @space.typology } }
    end

    assert_redirected_to space_url(Space.last)
  end

  test "should show space" do
    get space_url(@space)
    assert_response :success
  end

  test "should get edit" do
    get edit_space_url(@space)
    assert_response :success
  end

  test "should update space" do
    patch space_url(@space), params: { space: { dep_name: @space.dep_name, department_id: @space.department_id, description: @space.description, floor: @space.floor, name: @space.name, number_of_seats: @space.number_of_seats, state: @space.state, typology: @space.typology } }
    assert_redirected_to space_url(@space)
  end

  test "should destroy space" do
    assert_difference("Space.count", -1) do
      delete space_url(@space)
    end

    assert_redirected_to spaces_url
  end
end
