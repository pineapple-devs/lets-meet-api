class MeetingsController < ApplicationController
  before_action :set_user
  before_action :set_meeting, only: [:show, :update, :destroy]

  # GET users/1/meetings
  def index
    @meetings = @user.meetings

    render json: @meetings, :include => :intervals
  end

  # GET users/1/meetings/1
  def show
    render json: @meeting, :include => :intervals
  end

  # POST users/1/meetings
  def create
    @meeting = @user.meetings.create(meeting_params)

    create_intervals if @meeting
    create_invitations if params[:invitations]

    if @meeting
      render json: @meeting,
             include: :intervals,
             status: :created,
             location: user_meeting_url(@user, @meeting)
    else
      render json: @meeting.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT users/1/meetings/1
  def update
    if @meeting.update(meeting_params)
      update_intervals

      render json: @meeting, :include => :intervals
    else
      render json: @meeting.errors, status: :unprocessable_entity
    end
  end

  # DELETE users/1/meetings/1
  def destroy
    @meeting.destroy
  end

  private
    def set_user
      @user = User.find(params[:user_id])
    end

    def set_user_by_email(email)
      User.find_by_email(email)
    end

    def set_meeting
      @meeting = @user.meetings.find(params[:id])
    end

    def create_intervals
      params[:intervals].each do |interval|
        @meeting.intervals.create(start_time: interval[:start_time],
                                  end_time: interval[:end_time],
                                  user: @user,
                                  meeting: @meeting)
      end
    end

    def create_invitations
      params[:invitations].each do |invitation|
        invited_user = set_user_by_email(invitation[:email])
        invite = @meeting.invitations.create(
          :email => invitation[:email],
          :user => invited_user
        )

        InvitationMailer.invitation_mail(invite).deliver_later if send_email?(invited_user)
        InvitationNotification.send_invitation(invite, invited_user) if send_push?(invited_user)
      end
    end

    def send_email?(invited_user)
      return true unless invited_user.present?

      invited_user.email_opt_in
    end

    def send_push?(invited_user)
      invited_user.present? && invited_user.push_opt_in
    end

    def update_intervals
      @meeting.intervals.first.destroy

      create_intervals
    end

    # Only allow a trusted parameter "white list" through.
    def meeting_params
      params.require(:meeting).permit(:title, :description, :user_id, :location)
    end
end
