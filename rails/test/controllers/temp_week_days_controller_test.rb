require "test_helper"

class TempWeekDaysControllerTest < ActionDispatch::IntegrationTest
  setup do
    @temp_week_day = temp_week_days(:one)
  end

  test "should get index" do
    get temp_week_days_url
    assert_response :success
  end

  test "should get new" do
    get new_temp_week_day_url
    assert_response :success
  end

  test "should create temp_week_day" do
    assert_difference("TempWeekDay.count") do
      post temp_week_days_url, params: { temp_week_day: { apertura: @temp_week_day.apertura, chiusura: @temp_week_day.chiusura, day: @temp_week_day.day, dep_name: @temp_week_day.dep_name, state: @temp_week_day.state, temp_dep_id: @temp_week_day.temp_dep_id } }
    end

    assert_redirected_to temp_week_day_url(TempWeekDay.last)
  end

  test "should show temp_week_day" do
    get temp_week_day_url(@temp_week_day)
    assert_response :success
  end

  test "should get edit" do
    get edit_temp_week_day_url(@temp_week_day)
    assert_response :success
  end

  test "should update temp_week_day" do
    patch temp_week_day_url(@temp_week_day), params: { temp_week_day: { apertura: @temp_week_day.apertura, chiusura: @temp_week_day.chiusura, day: @temp_week_day.day, dep_name: @temp_week_day.dep_name, state: @temp_week_day.state, temp_dep_id: @temp_week_day.temp_dep_id } }
    assert_redirected_to temp_week_day_url(@temp_week_day)
  end

  test "should destroy temp_week_day" do
    assert_difference("TempWeekDay.count", -1) do
      delete temp_week_day_url(@temp_week_day)
    end

    assert_redirected_to temp_week_days_url
  end
end
