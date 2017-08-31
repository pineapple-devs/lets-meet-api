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

    def create_intervals
      params[:intervals].each do |interval|
        @meeting.intervals.create(start_time: params[:start_time],
                                  end_time: params[:end_time],
                                  user: @user,
                                  meeting: @meeting)
      end
    end

    # Only allow a trusted parameter "white list" through.
    def meeting_params
      params.require(:meeting).permit(:title, :description, :user_id)
    end
end
