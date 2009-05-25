class BackClientsController < ApplicationController
  layout "back"
  
  def list#shwo
    @clients = Client.paginate( :page => params[:page], 
      :per_page => 10,
      :order => "updated_at DESC")
  end

  # GET /clients/1
  # GET /clients/1.xml
  def show
    if params[:list]
      @client = Client.find(:first,:conditions => [ "id = ?" , params[:list]])
    else 
      @client = Client.find(params[:id])
    end
   
  end

  # GET /clients/new
  # GET /clients/new.xml
  def new
    @client = Client.new
    
  end

  # GET /clients/1/edit
  def edit
    @client = Client.find(params[:id])
  end

  # POST /clients
  # POST /clients.xml
  def create
    @client = Client.new(params[:client])

    respond_to do |format|
      if @client.save
        flash[:notice] = 'client was successfully created.'
        format.html { redirect_to :action => 'list'  }
        format.xml  { render :xml => @client, :status => :created, :location => @client }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @client.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /clients/1
  # PUT /clients/1.xml
  def update
    @client = Client.find(params[:id])

    respond_to do |format|
      if @client.update_attributes(params[:client])
        flash[:notice] = 'client was successfully updated.'
        format.html { redirect_to :action => 'show', :id => @client.id  }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @client.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /clients/1
  # DELETE /clients/1.xml
  def destroy
    @client = Client.find(params[:id])
    @client.destroy

    respond_to do |format|
      format.html { redirect_to :action => 'list' }
      format.xml  { head :ok }
    end
  end
  
  def clients_comm
    @client =AboutComm.find_by_name('client')
  end
  
  def clients_new
    @temp =AboutComm.find_by_name('client')
    unless @temp
      @about_comm= AboutComm.new
      @about_comm.update_attribute(:name,'client' )
      @about_comm.save      
    end
    @client =AboutComm.find_by_name('client')
  end
  
  def create_client
    @about_comm= AboutComm.find(params[:id])

    respond_to do |format|
      if @about_comm.update_attributes(params[:about_comm])
        flash[:notice] = 'successfully updated.'
        format.html { redirect_to :action => 'clients_comm' }
        format.xml  { head :ok }
      else
        format.html { render :action => "clients_new" }
        format.xml  { render :xml => @client.errors, :status => :unprocessable_entity }
      end
    end
  end
end
