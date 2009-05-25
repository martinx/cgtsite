class BackAboutController < ApplicationController
  def com_col
    @com_col =About.find_by_name('com_col')
  end
  
  def com_col_new
    @com_col =About.find_by_name('com_col')
  end
  
  def create_com_col
    @about= About.find(params[:id])

    respond_to do |format|
      if @about.update_attributes(params[:about])
        flash[:notice] = 'successfully updated.'
        format.html { redirect_to :action => 'com_col' }
        format.xml  { head :ok }
      else
        format.html { render :action => "com_col_new" }
        format.xml  { render :xml => @service.errors, :status => :unprocessable_entity }
      end
    end
  end
  
    def destroy_com_col
    @service = Service.find(params[:id])
    @service.destroy

    respond_to do |format|
      format.html { redirect_to :action => 'list' }
      format.xml  { head :ok }
    end
  end
  
    def team_col
    @team_col =About.find_by_name('team_col')
  end
  
  def team_col_new
    @team_col =About.find_by_name('team_col')
  end
  
  def create_team_col
    @about= About.find(params[:id])

    respond_to do |format|
      if @about.update_attributes(params[:about])
        flash[:notice] = 'successfully updated.'
        format.html { redirect_to :action => 'team_col' }
        format.xml  { head :ok }
      else
        format.html { render :action => "team_col_new" }
        format.xml  { render :xml => @service.errors, :status => :unprocessable_entity }
      end
    end
  end
  
  def princ
    @princ =About.find_by_name('princ')
  end
  
  def princ_new
    @princ =About.find_by_name('princ')
  end
  
  def create_princ
    @about= About.find(params[:id])

    respond_to do |format|
      if @about.update_attributes(params[:about])
        flash[:notice] = 'successfully updated.'
        format.html { redirect_to :action => 'princ' }
        format.xml  { head :ok }
      else
        format.html { render :action => "princ_new" }
        format.xml  { render :xml => @service.errors, :status => :unprocessable_entity }
      end
    end
  end
  
  def com_page
    @com_page =About.find_by_name('com_page')
  end
  
  def com_page_new
    @com_page =About.find_by_name('com_page')
  end
  
  def create_com_page
    @about= About.find(params[:id])

    respond_to do |format|
      if @about.update_attributes(params[:about])
        flash[:notice] = 'successfully updated.'
        format.html { redirect_to :action => 'com_page' }
        format.xml  { head :ok }
      else
        format.html { render :action => "com_page_new" }
        format.xml  { render :xml => @service.errors, :status => :unprocessable_entity }
      end
    end
  end
  
  def team_page
    @team_page =About.find_by_name('team_page')
  end
  
  def team_page_new
    @team_page =About.find_by_name('team_page')
  end
  
  def create_team_page
    @about= About.find(params[:id])

    respond_to do |format|
      if @about.update_attributes(params[:about])
        flash[:notice] = 'successfully updated.'
        format.html { redirect_to :action => 'team_page' }
        format.xml  { head :ok }
      else
        format.html { render :action => "team_page_new" }
        format.xml  { render :xml => @service.errors, :status => :unprocessable_entity }
      end
    end
  end
  
    
end
