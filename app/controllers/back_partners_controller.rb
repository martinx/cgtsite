class BackPartnersController < ApplicationController
  layout "back"
  
  def list#shwo
    @partners = Partner.paginate( :page => params[:page], 
      :per_page => 10,
      :order => "updated_at DESC")
  end

  # GET /partners/1
  # GET /partners/1.xml
  def show
    if params[:list]
      @partner = Partner.find(:first,:conditions => [ "id = ?" , params[:list]])
    else 
      @partner = Partner.find(params[:id])
    end
   
  end

  # GET /partners/new
  # GET /partners/new.xml
  def new
    @partner = Partner.new
    
  end

  # GET /partners/1/edit
  def edit
    @partner = Partner.find(params[:id])
  end

  # POST /partners
  # POST /partners.xml
  def create
    @partner = Partner.new(params[:partner])

    respond_to do |format|
      if @partner.save
        flash[:notice] = 'partner was successfully created.'
        format.html { redirect_to :action => 'list'  }
        format.xml  { render :xml => @partner, :status => :created, :location => @partner }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @partner.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /partners/1
  # PUT /partners/1.xml
  def update
    @partner = Partner.find(params[:id])

    respond_to do |format|
      if @partner.update_attributes(params[:partner])
        flash[:notice] = 'partner was successfully updated.'
        format.html { redirect_to :action => 'show', :id => @partner.id  }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @partner.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /partners/1
  # DELETE /partners/1.xml
  def destroy
    @partner = Partner.find(params[:id])
    @partner.destroy

    respond_to do |format|
      format.html { redirect_to :action => 'list' }
      format.xml  { head :ok }
    end
  end
  
  def partners_comm
    @partner =AboutComm.find_by_name('partner')
  end
  
  def partners_new
    @temp =AboutComm.find_by_name('partner')
    unless @temp
      @about_comm= AboutComm.new
      @about_comm.update_attribute(:name,'partner' )
      @about_comm.save      
    end
    @partner =AboutComm.find_by_name('partner')
  end
  
  def create_partner
    @about_comm= AboutComm.find(params[:id])

    respond_to do |format|
      if @about_comm.update_attributes(params[:about_comm])
        flash[:notice] = 'successfully updated.'
        format.html { redirect_to :action => 'partners_comm' }
        format.xml  { head :ok }
      else
        format.html { render :action => "partners_new" }
        format.xml  { render :xml => @partner.errors, :status => :unprocessable_entity }
      end
    end
  end
  
  
end


