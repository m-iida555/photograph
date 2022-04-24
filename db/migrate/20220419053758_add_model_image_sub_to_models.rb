class AddModelImageSubToModels < ActiveRecord::Migration[6.1]
  def change
    add_column :models, :model_image_sub, :text
  end
end
