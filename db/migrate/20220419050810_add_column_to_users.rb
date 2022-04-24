class AddColumnToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :girl_name, :string
  end
end
