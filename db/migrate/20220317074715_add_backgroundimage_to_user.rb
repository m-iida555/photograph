class AddBackgroundimageToUser < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :background_image, :text
  end
end
