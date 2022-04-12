class SchedulesController < ApplicationController
  def index
  end

  def show
  end

  def new
    @schedule = Schedule.new
  end

  def create
    @schedule = Schedule.create(params.require(:schedule).permit(:name, :date_start, :place_image, :explain, :place))
    if @schedule.save
      redirect_to schedule_path(@schedule.id)
    else
      redirect_to new_schedule_path
    end
  end
end
