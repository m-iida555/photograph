class ModelsController < ApplicationController
  def index
    @models = Model.all
  end

  def new
    @model = Model.new
  end

  def create
    @model = Model.create(model_create)
    if @model.save
      redirect_to model_path(@model.id)
    else
      redirect_to new_model_path
    end
  end

  def show
    @model = Model.find(params[:id])
  end

private

  def model_create
    params.require(:model).permit(:girl_name, :model_image, {model_image_sub: []}, :model_job, :model_hobby, :model_comment)
  end
end
