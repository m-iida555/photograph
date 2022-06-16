class RemoveIndexFromScheduleModels < ActiveRecord::Migration[6.1]
  def change
    remove_column :schedule_models, :model_id, :index
    remove_column :schedule_models, :schedule_id, :index
  end
end
