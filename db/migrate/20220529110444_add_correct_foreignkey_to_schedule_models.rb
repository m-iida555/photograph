class AddCorrectForeignkeyToScheduleModels < ActiveRecord::Migration[6.1]
  def change
    add_reference :schedule_models, :schedule, foreign_key: true
    add_reference :schedule_models, :model, foreign_key: true
  end
end
