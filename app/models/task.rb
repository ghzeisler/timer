class Task < ActiveRecord::Base
validates :task, presence: true
validates :date_time, presence: true
  attr_accessible :task, :date_time,:time_zone
end
