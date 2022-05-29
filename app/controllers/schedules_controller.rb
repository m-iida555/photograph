class SchedulesController < ApplicationController
  def index
    @schedules = Schedule.all
  end

  def new
    @schedule = Schedule.new
  end

  def create
    @schedule = Schedule.create(schedule_create)
    if @schedule.save
      redirect_to schedule_path(@schedule.id)
    else
      redirect_to 'new'
    end
  end

  def show
    @schedule = Schedule.find(params[:id])
  end

  def edit
    @schedule = Schedule.find(params[:id])
    @model = Model.find(params[:id])
    @plans = Schedule.update(plan_create)
      if @plan.save
        redirect_to schedule_path(@schedule.id)
      else
        redirect_to 'edit'
      end
  end
end

private

  def schedule_create
    params.require(:schedule).permit(:name, :start_time, :place_image, :explain, :place)
  end

  def plan_create
    params.permit(:name, :start_time, :place_image, :explain, :place, girl_name)
  end
