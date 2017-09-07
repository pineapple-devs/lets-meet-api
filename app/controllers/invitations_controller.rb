class InvitationsController < ApplicationController
  before_action :set_user
  before_action :set_meeting
  before_action :set_invitation, :only => [:show, :update]

  def index
    @invitations = @meeting.invitations

    render json: @invitations
 end

  def show
    render json: @invitations
  end

  def update
    if @invitation.update(invitation_params)
      render json: @invitations
    else
      render json: @invitation.errors, status: :unprocessable_entity
    end
  end

  private

    def set_user
      @user = User.find(params[:user_id])
    end

    def set_meeting
      @meeting = @user.meetings.find(params[:meeting_id])
    end

    def set_invitation
      @invitation = @meeting.invitations.find(params[:id])
    end

    def invitation_params
      params.require(:invitation).permit(:email, :accepted, :user_id, :meeting_id)
    end
end
