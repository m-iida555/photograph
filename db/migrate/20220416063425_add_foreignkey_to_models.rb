class AddForeignkeyToModels < ActiveRecord::Migration[6.1]
  def change
    add_column :models, :user_id, :integer
    add_column :models, :schedule_id, :integer
  end
end
