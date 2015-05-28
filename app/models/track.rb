class Track < ActiveRecord::Base
  has_many :events, -> { order(:start) }


  def self.actual_tracks
    Track.where("id != ?", 1)
  end

  def total_events_on_day(date)
    general_track_events = Track.first.events.on_day(date)
    current_track_events = events.on_day(date)
    event_collection = current_track_events + general_track_events
    event_collection
  end

end