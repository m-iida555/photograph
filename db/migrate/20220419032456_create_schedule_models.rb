class CreateScheduleModels < ActiveRecord::Migration[6.1]
  def change
    create_table :schedule_models do |t|
      t.references :schedule, null: false, foreign_key: true
      t.references :model, null: false, foreign_key: true

      t.timestamps
    end
  end
end
