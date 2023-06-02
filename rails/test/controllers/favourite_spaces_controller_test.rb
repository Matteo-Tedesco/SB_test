require "test_helper"

class FavouriteSpacesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @favourite_space = favourite_spaces(:one)
  end

  test "should get index" do
    get favourite_spaces_url
    assert_response :success
  end

  test "should get new" do
    get new_favourite_space_url
    assert_response :success
  end

  test "should create favourite_space" do
    assert_difference("FavouriteSpace.count") do
      post favourite_spaces_url, params: { favourite_space: { dep_name: @favourite_space.dep_name, department_id: @favourite_space.department_id, email: @favourite_space.email, space_id: @favourite_space.space_id, space_name: @favourite_space.space_name, typology: @favourite_space.typology, user_id: @favourite_space.user_id } }
    end

    assert_redirected_to favourite_space_url(FavouriteSpace.last)
  end

  test "should show favourite_space" do
    get favourite_space_url(@favourite_space)
    assert_response :success
  end

  test "should get edit" do
    get edit_favourite_space_url(@favourite_space)
    assert_response :success
  end

  test "should update favourite_space" do
    patch favourite_space_url(@favourite_space), params: { favourite_space: { dep_name: @favourite_space.dep_name, department_id: @favourite_space.department_id, email: @favourite_space.email, space_id: @favourite_space.space_id, space_name: @favourite_space.space_name, typology: @favourite_space.typology, user_id: @favourite_space.user_id } }
    assert_redirected_to favourite_space_url(@favourite_space)
  end

  test "should destroy favourite_space" do
    assert_difference("FavouriteSpace.count", -1) do
      delete favourite_space_url(@favourite_space)
    end

    assert_redirected_to favourite_spaces_url
  end
end
