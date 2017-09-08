require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:one)
  end

  test "should create user" do
    assert_difference('User.count') do
      post users_url, params: { user: { email: @user.email, name: @user.name } }, as: :json
    end

    assert_response 201
  end

  test "should show user" do
    get user_url(@user), as: :json
    assert_response :success
  end

  test "should update user" do
    patch user_url(@user), params: { user: { email: @user.email, name: @user.name } }, as: :json
    assert_response 200
  end

  test "should destroy user" do
    assert_difference('User.count', -1) do
      delete user_url(@user), as: :json
    end

    assert_response 204
  end

  test "should return invitation user created" do
    get user_sent_invitations_url(@user), as: :json
    assert_response :success
  end

  test "should return invitation user received" do
    get user_received_invitations_url(@user), as: :json
    assert_response :success
  end

  test "should return head ok" do
    post user_register_device_url(@user), params: { token: "aslkf", os: "android" }, as: :json
    assert_response :success
  end
end
