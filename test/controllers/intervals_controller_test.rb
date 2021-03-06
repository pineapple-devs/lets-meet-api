require 'test_helper'

class IntervalsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:one)
    @meetings = meetings(:one)
    @interval = intervals(:one)
  end

  test "should create interval" do
    assert_difference('Interval.count') do
      post user_meeting_intervals_url(@interval.user_id, @interval.meeting_id, @interval),
           params: { interval: { end_time: @interval.end_time, meeting_id: @interval.meeting_id, start_time: @interval.start_time, user_id: @interval.user_id } }, as: :json
    end

    assert_response 201
  end

  test "should show interval" do
    get user_meeting_interval_url(@interval.user_id, @interval.meeting_id, @interval), as: :json
    assert_response :success
  end
end
