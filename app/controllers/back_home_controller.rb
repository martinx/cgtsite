class BackHomeController < ApplicationController
  layout "back"
def event
    @event =About.find_by_name('event')
  end
  
  def event_new
    @event =About.find_by_name('event')
  end
  
  def create_event
    @about= About.find(params[:id])

    respond_to do |format|
      if @about.update_attributes(params[:about])
        flash[:notice] = 'successfully updated.'
        format.html { redirect_to :action => 'event' }
        format.xml  { head :ok }
      else
        format.html { render :action => "event_new" }
        format.xml  { render :xml => @service.errors, :status => :unprocessable_entity }
      end
    end
  end
  
  def wel
    @wel =About.find_by_name('wel')
    if @wel
      redirect_to :action => 'wel_new'
    end
  end
  
  def wel_new
    @wel =About.find_by_name('wel')
  end
  
  def create_wel
    @about= About.find(params[:id])

    respond_to do |format|
      if @about.update_attributes(params[:about])
        flash[:notice] = 'successfully updated.'
        format.html { redirect_to :action => 'wel' }
        format.xml  { head :ok }
      else
        format.html { render :action => "wel_new" }
        format.xml  { render :xml => @service.errors, :status => :unprocessable_entity }
      end
    end
  end

end
