class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :address
      t.integer :birth_year
      t.integer :birth_month
      t.integer :birth_day
      t.integer :telephone
      t.text :image

      t.timestamps
    end
  end
end
