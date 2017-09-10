class InvitationsController < ApplicationController
  before_action :set_user
  before_action :set_meeting
  before_action :set_invitation, :only => [:show, :update]

  def index
    @invitations = @meeting.invitations

    render json: @invitations
 end

  def show
    render json: @invitation
  end

  def update
    if @invitation.update(invitation_params)
      if send_push?
        InvitationNotification.send_invitation_changed(@invitation, @invitation.user)
      end

      render json: @invitation
    else
      render json: @invitation.errors, status: :unprocessable_entity
    end
  end

  def answer_email
    @invitation = @meeting.invitations.find(params[:invitation_id])

    if @invitation.update(invitation_params)
      if send_push?
        InvitationNotification.send_invitation_changed(@invitation, @invitation.user)
      end

      render text: "Successfully updated your invitation"
    else
      render text: @invitation.errors, status: :unprocessable_entity
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

    def send_push?
      @user.push_opt_in
    end

    def invitation_params
      params.require(:invitation).permit(:email, :accepted, :user_id, :meeting_id)
    end
end
