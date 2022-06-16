class UserSchedule < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :schedule, optional: true
end
