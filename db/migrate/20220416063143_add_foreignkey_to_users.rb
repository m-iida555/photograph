class AddForeignkeyToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :schedule_id, :integer
    add_column :users, :model_id, :integer
  end
end
