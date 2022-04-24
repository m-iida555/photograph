class AddColumnToUserSchedules < ActiveRecord::Migration[6.1]
  def change
    add_reference :user_schedules, :user, null: false, foreign_key: true
    add_reference :user_schedules, :schedule, null: false, foreign_key: true
  end
end
