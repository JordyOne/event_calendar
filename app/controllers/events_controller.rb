class EventsController < ApplicationController
  def index
    @tracks = Track.all
    if params[:event]
      event = Event.find(params[:event].first)
      @date = event.start
    else
      @date = Event.all.sample.start
    end
  end
end