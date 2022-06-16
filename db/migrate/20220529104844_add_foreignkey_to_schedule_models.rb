class AddForeignkeyToScheduleModels < ActiveRecord::Migration[6.1]
  def change
    add_reference :schedule_models, :schedule_id, index: true
    add_reference :schedule_models, :model_id, index: true
  end
end
