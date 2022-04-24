class AddPlacenumberToSchedules < ActiveRecord::Migration[6.1]
  def change
    add_column :schedules, :place_d, :integer, default: 0
  end
end
