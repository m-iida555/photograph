class CreateUserSchedules < ActiveRecord::Migration[6.1]
  def change
    create_table :user_schedules do |t|

      t.timestamps
    end
  end
end
