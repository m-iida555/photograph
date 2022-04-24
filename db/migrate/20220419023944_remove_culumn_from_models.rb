class RemoveCulumnFromModels < ActiveRecord::Migration[6.1]
  def change
    remove_column :models, :user_id, :integer
    remove_column :models, :schedule_id, :integer
  end
end
