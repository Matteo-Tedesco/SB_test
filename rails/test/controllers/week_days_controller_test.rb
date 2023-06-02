require "test_helper"

class WeekDaysControllerTest < ActionDispatch::IntegrationTest
  setup do
    @week_day = week_days(:one)
  end

  test "should get index" do
    get week_days_url
    assert_response :success
  end

  test "should get new" do
    get new_week_day_url
    assert_response :success
  end

  test "should create week_day" do
    assert_difference("WeekDay.count") do
      post week_days_url, params: { week_day: { apertura: @week_day.apertura, chiusura: @week_day.chiusura, day: @week_day.day, dep_name: @week_day.dep_name, department_id: @week_day.department_id, state: @week_day.state } }
    end

    assert_redirected_to week_day_url(WeekDay.last)
  end

  test "should show week_day" do
    get week_day_url(@week_day)
    assert_response :success
  end

  test "should get edit" do
    get edit_week_day_url(@week_day)
    assert_response :success
  end

  test "should update week_day" do
    patch week_day_url(@week_day), params: { week_day: { apertura: @week_day.apertura, chiusura: @week_day.chiusura, day: @week_day.day, dep_name: @week_day.dep_name, department_id: @week_day.department_id, state: @week_day.state } }
    assert_redirected_to week_day_url(@week_day)
  end

  test "should destroy week_day" do
    assert_difference("WeekDay.count", -1) do
      delete week_day_url(@week_day)
    end

    assert_redirected_to week_days_url
  end
end
