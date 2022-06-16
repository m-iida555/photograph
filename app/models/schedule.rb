class Schedule < ApplicationRecord
    mount_uploader :place_image, PlacesUploader
    has_many :user_schedules
    has_many :users, through: :user_schedule
    accepts_nested_attributes_for :user_schedules, allow_destroy: true

    has_many :schedule_models
    has_many :models, through: :schedule_models
    accepts_nested_attributes_for :schedule_models, allow_destroy: true
end
