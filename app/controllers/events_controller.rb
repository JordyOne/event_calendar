class EventsController < ApplicationController
  def index
    @tracks = Track.all
  end
end