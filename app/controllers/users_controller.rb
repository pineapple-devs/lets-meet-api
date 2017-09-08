class UsersController < ApplicationController
  before_action :set_user, only: [:show, :update, :destroy]

  # GET /users/1
  def show
    render json: @user
  end

  # POST /users
  def create
    @user = User.new(user_params)

    if @user.save
      render json: @user, status: :created, location: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /users/1
  def update
    if @user.update(user_params)
      render json: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  # DELETE /users/1
  def destroy
    @user.destroy
  end

  # GET /users/1/sent_invitations
  #
  # Returns invitations created by user.
  def sent_invitations
    user = User.find(params[:user_id])
    @invitations = Invitation.created_by_user(user)

    render json: @invitations
  end

  # GET /users/1/received_invitations
  #
  # Returns invitations received by user.
  def received_invitations
    user = User.find(params[:user_id])
    @invitations = user.invitations

    render json: @invitations
  end

  # POST /users/1/register_device
  #
  # Registers user's device with token and OS she is using
  def register_device
    user = User.find(params[:user_id])

    user.devices.find_or_create_by(token: params[:token], os: params[:os])

    head :ok
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def user_params
      params.require(:user).permit(:name, :email)
    end
end
