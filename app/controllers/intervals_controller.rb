class IntervalsController < ApplicationController
  before_action :set_interval, only: [:show, :update, :destroy]

  # GET /intervals
  def index
    @intervals = Interval.all

    render json: @intervals
  end

  # GET /intervals/1
  def show
    render json: @interval
  end

  # POST /intervals
  def create
    @interval = Interval.new(interval_params)

    if @interval.save
      render json: @interval, status: :created, location: @interval
    else
      render json: @interval.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /intervals/1
  def update
    if @interval.update(interval_params)
      render json: @interval
    else
      render json: @interval.errors, status: :unprocessable_entity
    end
  end

  # DELETE /intervals/1
  def destroy
    @interval.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_interval
      @interval = Interval.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def interval_params
      params.require(:interval).permit(:start_time, :end_time, :user_id, :meeting_id)
    end
end
