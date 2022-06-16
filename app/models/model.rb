class Model < ApplicationRecord
  mount_uploader :model_image, ModelsUploader
  mount_uploaders :model_image_sub, ModelSubUploader
  serialize :model_image_sub, JSON
  has_many :schedule_models
  has_many :schedules, through: :schedule_models
  accepts_nested_attributes_for :schedule_models, allow_destroy: true

  validates :girl_name, presence: true
  validates :model_image, presence: true
end
