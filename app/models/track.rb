class Track < ActiveRecord::Base
  has_many :events, -> { order(:start) }

  def self.actual_tracks
    general_track = Track.find(1)
    Track.all(conditions: ["id != ?", 1]).map { |track| track.merge(general_track) }
  end

end