class LoginController < ApplicationController
  before_action :set_user

  # GET login
  def login
    if @user && @user.password == params[:password]
      render json: @user.id, status: 200
    else
      render json: "Wrong email and password combination", status: 404
    end
  end

  private
    def set_user
      @user = User.find_by(name: params[:username])
    end
end
