class RemoveColumnFromSchedules < ActiveRecord::Migration[6.1]
  def change
    remove_column :schedules, :model_id, :integer
    remove_column :schedules, :user_id, :integer
  end
end
