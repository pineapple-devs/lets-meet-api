require 'test_helper'

class LoginControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:one)
  end

  test "should get login with success" do
    get login_url(username: @user.name, password: @user.password), as: :json
    assert_response :success
  end

  test "should return proper response body" do
    ENV["GOOGLE_PLACES_API_WEB_SERVICE_KEY"] = "google_api_key"
    ENV["SENDER_ID"] = "123124"

    get login_url(username: @user.name, password: @user.password), as: :json

    body = JSON.parse(response.body)
    assert_equal body, { "userId" => @user.id,
                         "appCredentials" => { "googlePlacesApiKey" => "google_api_key",
                                               "senderId" => "123124"} }
  end

  test "should get login with failure" do
    get login_url(username: @user.name, password: "fruit"), as: :json
    assert_response :missing
  end

end
