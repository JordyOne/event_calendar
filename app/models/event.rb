class Event < ActiveRecord::Base
  belongs_to :track
  scope :on_day, (lambda do |day|
                 where(start: day.beginning_of_day..day.end_of_day)
               end)
end