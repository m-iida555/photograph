class Model < ApplicationRecord
  mount_uploader :model_image, ModelsUploader
  mount_uploaders :model_image_sub, ModelSubUploader
  serialize :model_image_sub, JSON
  has_many :users
  has_many :schedules

  validates :girl_name, presence: true, uniqueness: true
  validates :model_image, presence: true
end
