class Schedule < ApplicationRecord
    mount_uploader :place_image, PlacesUploader
    has_many :user_schedules
    has_many :users, through: :user_schedules
end
