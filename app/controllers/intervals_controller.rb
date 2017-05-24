class IntervalsController < ApplicationController
  before_action :set_user
  before_action :set_meeting
  before_action :set_interval, only: [:show, :update, :destroy]

  # GET users/1/meetings/1/intervals
  def index
    @intervals = @meeting.intervals

    render json: @intervals, :include => { :meeting => { :only => [:title, :description] } }
  end

  # GET users/1/meetings/1/intervals/1
  def show
    render json: @interval, :include => { :meeting => { :only => [:title, :description] } }
  end

  # POST users/1/meetings/1/intervals
  def create
    @interval = @meeting.intervals.build(interval_params)

    if @interval.save
      render json: @interval,
             include: { meeting: { only: [:title, :description] } },
             status: :created,
             location: user_meeting_interval_url(@user, @meeting, @interval)
    else
      render json: @interval.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT users/1/meetings/1/intervals/1
  def update
    if @interval.update(interval_params)
      render json: @interval, :include => { :meeting => { :only => [:title, :description] } }
    else
      render json: @interval.errors, status: :unprocessable_entity
    end
  end

  # DELETE users/1/meetings/1/intervals/1
  def destroy
    @interval.destroy
  end

  private
    def set_user
      @user = User.find(params[:user_id])
    end

    def set_meeting
      @meeting = @user.meetings.find(params[:meeting_id])
    end

    def set_interval
      @interval = @meeting.intervals.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def interval_params
      params.require(:interval).permit(:start_time, :end_time, :user_id, :meeting_id)
    end
end
