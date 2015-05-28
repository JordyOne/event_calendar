class Track < ActiveRecord::Base
  has_many :events, -> { order(:start) }

end