class ScheduleModel < ApplicationRecord
  belongs_to :schedule, optional: true
  belongs_to :model, optional: true
end
