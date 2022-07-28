class SchedulesController < ApplicationController
  def index
    @schedules = Schedule.all
  end

  def new
    @schedule = Schedule.new
  end

  def create
    @schedule = Schedule.create(schedule_create)
    @model = @schedule.models.build(model_create)
    if @schedule.save
      redirect_to schedule_path(@schedule.id)
    else
      redirect_to 'new'
    end
  end

  def show
    @schedule = Schedule.find(params[:id])
    @model = @schedule.models.where(id: :schedule_id)
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

  def destroy
    @destroy = Schedule.find(params[:id])
    if @destroy.destroy
      redirect_to root_path
    end
  end
end

private

  def schedule_create
    params.require(:schedule).permit(:name, :start_time, :place_image, :explain, :place, :girl_name, model_ids: [])
  end

  def model_create
    params.require(:model).permit(:schedule_id)
  end

  def plan_create
    params.require(:schedule).permit(:name, :start_time, :place_image, :explain, :place, model_ids: [])
  end
