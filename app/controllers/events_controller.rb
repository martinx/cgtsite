class EventsController < ApplicationController
  def index
    @events = Event.paginate( :page => params[:page], 
      :per_page => 10,
      :order => "updated_at DESC")
  end
  
  def report
    @event = Event.find(params[:id])
  end
end
