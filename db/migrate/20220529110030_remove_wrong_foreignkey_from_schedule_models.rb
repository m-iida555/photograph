class RemoveWrongForeignkeyFromScheduleModels < ActiveRecord::Migration[6.1]
  def change
    remove_column :schedule_models, :schedule_id_id, :integer
    remove_column :schedule_models, :schedule_id_id, :index
    remove_column :schedule_models, :model_id_id, :integer
    remove_column :schedule_models, :model_id_id, :index
  end
end
