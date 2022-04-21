class RemoveGirlNameFromUsers < ActiveRecord::Migration[6.1]
  def change
    remove_column :users, :girl_name, :string
  end
end
