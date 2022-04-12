class CreateSchedules < ActiveRecord::Migration[6.1]
  def change
    create_table :schedules do |t|
      t.datetime :start_time
      t.string :name
      t.string :place
      t.string :explain
      t.text :place_image

      t.timestamps
    end
  end
end
