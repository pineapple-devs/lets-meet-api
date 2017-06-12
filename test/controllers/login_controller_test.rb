require 'test_helper'

class LoginControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:one)
  end

  test "should get login with success" do
    get login_url(username: @user.name, password: @user.password), as: :json
    assert_response :success
  end

  test "should get login with failure" do
    get login_url(username: @user.name, password: "fruit"), as: :json
    assert_response :missing
  end

end
