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
    @meeting = @user.meetings.build(meeting_params)

    if @meeting.save
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

    def set_meeting
      @meeting = @user.meetings.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def meeting_params
      params.require(:meeting).permit(:title, :description, :user_id)
    end
end
