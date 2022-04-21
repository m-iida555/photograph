class AddGirlNameToModels < ActiveRecord::Migration[6.1]
  def change
    add_column :models, :girl_name, :string
  end
end
