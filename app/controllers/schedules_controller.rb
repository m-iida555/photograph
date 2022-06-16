class SchedulesController < ApplicationController
  def index
    @schedules = Schedule.all
  end

  def new
    @schedule = Schedule.new
    @schedule.schedule_models.build
  end

  def create
    @schedule = Schedule.create(schedule_create)
    binding.pry
    if @schedule.save
      redirect_to schedule_path(@schedule.id)
    else
      redirect_to 'new'
    end
  end

  def show
    @schedule = Schedule.find(params[:id])
    #@model_image = @schedule.models.where(:model_id).where.not(image: nil)
    #@schedules = Model.find_by(params[:id])
    #@schedules = @schedule.models << Model.where(id: model_id)
    #@schedules = @schedule.models.build
    #@model = Model.where(params[:schedule_id])
    #@schedule_model = Schedule_model.find(params[:id])
    #@model = @schedule.models

  end

  def edit
    @schedule = Schedule.find(params[:id])
    @model = Model.all
  end

  def update
    @schedule = Schedule.find(params[:id])
    if @schedule.update(plan_create)
      redirect_to schedule_path(@schedule.id)
    else
      redirect_to 'edit'
    end
  end
end

private

  def schedule_create
    params.require(:schedule).permit(:name, :start_time, :place_image, :explain, :place, model_ids: [])
  end

  def plan_create
    params.require(:schedule).permit(:name, :start_time, :place_image, :explain, :place, model_ids: [])
  end
