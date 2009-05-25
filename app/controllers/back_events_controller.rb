class BackEventsController < ApplicationController
  layout "back"
  
  def index
    @events = Event.paginate( :page => params[:page], 
      :per_page => 10,
      :order => "updated_at DESC")
  end
  
  def show
    if params[:list]
      @event = Event.find(:first,:conditions => [ "id = ?" , params[:list]])
    else 
      @event = Event.find(params[:id])
    end
  end
  
  def edit
    @event = Event.find(params[:id])
  end
  
  def update
    @event = Event.find(:first,:conditions => [ "id = ?" , params[:id]])

    respond_to do |format|
      if @event.update_attributes(params[:event])
        flash[:notice] = 'Event was successfully updated.'
        format.html { redirect_to :action => "show" ,:id => @event.id }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @event.errors, :status => :unprocessable_entity }
      end
    end
  end
  
  def destroy
    @event = Event.find(params[:id])
    @event.destroy

    respond_to do |format|
      format.html { redirect_to :action => "index" }
      format.xml  { head :ok }
    end
  end
  
  def new
    @event = Event.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @event }
    end
  end
  
  def create
    @event = Event.new(params[:event])

    respond_to do |format|
      if @event.save
        flash[:notice] = 'Event was successfully created.'
        format.html { redirect_to  :action => "index" }
        format.xml  { render :xml => @event, :status => :created, :location => @event }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @event.errors, :status => :unprocessable_entity }
      end
    end
  end
end
