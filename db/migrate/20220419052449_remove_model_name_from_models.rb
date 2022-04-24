class RemoveModelNameFromModels < ActiveRecord::Migration[6.1]
  def change
    remove_column :models, :model_name, :string
  end
end
