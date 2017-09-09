class LoginController < ApplicationController
  before_action :set_user

  # GET login
  def login
    if @user && @user.password == params[:password]
      @app_credentials = { googlePlacesApiKey: ENV["GOOGLE_PLACES_API_WEB_SERVICE_KEY"],
                           senderId: ENV["SENDER_ID"] }
      render json: { userId: @user.id,
                     user: @user,
                     appCredentials: @app_credentials }, status: 200
    else
      render json: "Wrong email and password combination", status: 404
    end
  end

  private
    def set_user
      @user = User.find_by(name: params[:username])
    end
end
