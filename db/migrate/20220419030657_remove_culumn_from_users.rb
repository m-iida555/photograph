class RemoveCulumnFromUsers < ActiveRecord::Migration[6.1]
  def change
    remove_column :users, :schedule_id, :integer
    remove_column :users, :model_id, :integer
  end
end
