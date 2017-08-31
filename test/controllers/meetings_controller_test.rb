require 'test_helper'

class MeetingsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @meeting = meetings(:one)
  end

  test "should get index" do
    get user_meetings_url(@meeting.user_id), as: :json
    assert_response :success
  end

  test "should create meeting" do
    assert_difference('Meeting.count') do
      post user_meetings_url(@meeting.user_id), params: { meeting: { description: @meeting.description, title: @meeting.title, user_id: @meeting.user_id }, intervals: [{ start_time: Time.now, end_time: Time.now + 2.hours}] }, as: :json
    end

    assert_response 201
  end

  test "should show meeting" do
    get user_meeting_url(@meeting.user_id, @meeting), as: :json
    assert_response :success
  end

  test "should update meeting" do
    patch user_meeting_url(@meeting.user_id, @meeting), params: { meeting: { description: @meeting.description, title: @meeting.title, user_id: @meeting.user_id } }, as: :json
    assert_response 200
  end

  test "should destroy meeting" do
    assert_difference('Meeting.count', -1) do
      delete user_meeting_url(@meeting.user_id, @meeting), as: :json
    end

    assert_response 204
  end
end
