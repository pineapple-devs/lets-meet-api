require 'test_helper'

class IntervalsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @interval = intervals(:one)
  end

  test "should get index" do
    get intervals_url, as: :json
    assert_response :success
  end

  test "should create interval" do
    assert_difference('Interval.count') do
      post intervals_url, params: { interval: { end_time: @interval.end_time, meeting_id: @interval.meeting_id, start_time: @interval.start_time, user_id: @interval.user_id } }, as: :json
    end

    assert_response 201
  end

  test "should show interval" do
    get interval_url(@interval), as: :json
    assert_response :success
  end

  test "should update interval" do
    patch interval_url(@interval), params: { interval: { end_time: @interval.end_time, meeting_id: @interval.meeting_id, start_time: @interval.start_time, user_id: @interval.user_id } }, as: :json
    assert_response 200
  end

  test "should destroy interval" do
    assert_difference('Interval.count', -1) do
      delete interval_url(@interval), as: :json
    end

    assert_response 204
  end
end
