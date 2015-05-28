class EventsController < ApplicationController
  def index
    @tracks = Track.actual_tracks
    if params[:event]
      event = Event.find(event_params[:id])
      @date = event.start
    else
      @date = Event.all.sample.start
    end
  end

  private

  def event_params
    params.require(:event).permit(:id)
  end
end