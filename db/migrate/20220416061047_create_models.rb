class CreateModels < ActiveRecord::Migration[6.1]
  def change
    create_table :models do |t|
      t.string :model_name
      t.text :model_image
      t.string :model_job
      t.string :model_hobby
      t.string :model_comment

      t.timestamps
    end
  end
end
