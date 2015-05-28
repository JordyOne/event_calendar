class EventsController < ApplicationController
  def index
    @tracks = Track.all
    if params[:date]
      @date = Date.strptime(params[:date])
    else
      @date = Event.all.sample.start
    end
  end
end