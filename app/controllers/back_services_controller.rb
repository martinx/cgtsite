class BackServicesController < ApplicationController
  layout "back"
  
  def list
    @services = Service.paginate( :page => params[:page], 
      :per_page => 10,
      :order => "updated_at DESC")
  end

  # GET /services/1
  # GET /services/1.xml
  def show
    if params[:list]
      @service = Service.find(:first,:conditions => [ "id = ?" , params[:list]])
    else 
      @service = Service.find(params[:id])
    end
   
  end

  # GET /services/new
  # GET /services/new.xml
  def new
    @service_types =ServiceType.find(:all)   
    @service = Service.new
    
  end

  # GET /services/1/edit
  def edit
    @service = Service.find(params[:id])
    @service_types =ServiceType.find(:all)   
  end

  # POST /services
  # POST /services.xml
  def create
    @service = Service.new(params[:service])

    respond_to do |format|
      if @service.save
        @service.update_attribute(:service_type_id,params[:industry])
        flash[:notice] = 'Service was successfully created.'
        format.html { redirect_to :action => 'list'  }
        format.xml  { render :xml => @service, :status => :created, :location => @service }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @service.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /services/1
  # PUT /services/1.xml
  def update
    @service = Service.find(params[:id])

    respond_to do |format|
      if @service.update_attributes(params[:service])
        @service.update_attribute(:service_type_id,params[:industry])
        flash[:notice] = 'Service was successfully updated.'
        format.html { redirect_to :action => 'show', :id => @service.id  }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @service.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /services/1
  # DELETE /services/1.xml
  def destroy
    @service = Service.find(params[:id])
    @service.destroy

    respond_to do |format|
      format.html { redirect_to :action => 'list' }
      format.xml  { head :ok }
    end
  end
  
  def music_col
    @music =About.find_by_name('music')
  end
  
  def music_new
    @music =About.find_by_name('music')
  end
  
  def create_music
    @about= About.find(params[:id])

    respond_to do |format|
      if @about.update_attributes(params[:about])
        flash[:notice] = 'successfully updated.'
        format.html { redirect_to :action => 'music_col' }
        format.xml  { head :ok }
      else
        format.html { render :action => "music_new" }
        format.xml  { render :xml => @service.errors, :status => :unprocessable_entity }
      end
    end
  end
  
  def system_col
    @system =About.find_by_name('system')
  end
  
  def system_new
    @system =About.find_by_name('system')
  end
  
  def create_system
    @about= About.find(params[:id])

    respond_to do |format|
      if @about.update_attributes(params[:about])
        flash[:notice] = 'successfully updated.'
        format.html { redirect_to :action => 'system_col' }
        format.xml  { head :ok }
      else
        format.html { render :action => "system_new" }
        format.xml  { render :xml => @service.errors, :status => :unprocessable_entity }
      end
    end
  end
  
  def soft_col
    @soft =About.find_by_name('soft')
  end
  
  def soft_new
    @soft =About.find_by_name('soft')
  end
  
  def create_soft
    @about= About.find(params[:id])

    respond_to do |format|
      if @about.update_attributes(params[:about])
        flash[:notice] = 'successfully updated.'
        format.html { redirect_to :action => 'soft_col' }
        format.xml  { head :ok }
      else
        format.html { render :action => "soft_new" }
        format.xml  { render :xml => @service.errors, :status => :unprocessable_entity }
      end
    end
  end
  
  def train_col
    @train =About.find_by_name('train')
  end
  
  def train_new
    @train =About.find_by_name('train')
  end
  
  def create_train
    @about= About.find(params[:id])

    respond_to do |format|
      if @about.update_attributes(params[:about])
        flash[:notice] = 'successfully updated.'
        format.html { redirect_to :action => 'train_col' }
        format.xml  { head :ok }
      else
        format.html { render :action => "train_new" }
        format.xml  { render :xml => @service.errors, :status => :unprocessable_entity }
      end
    end
  end
  
  def servlist_col
    @servlist =About.find_by_name('servlist')
  end
  
  def servlist_new
    @servlist =About.find_by_name('servlist')
  end
  
  def create_servlist
    @about= About.find(params[:id])

    respond_to do |format|
      if @about.update_attributes(params[:about])
        flash[:notice] = 'successfully updated.'
        format.html { redirect_to :action => 'servlist_col' }
        format.xml  { head :ok }
      else
        format.html { render :action => "servlist_new" }
        format.xml  { render :xml => @service.errors, :status => :unprocessable_entity }
      end
    end
  end
end
