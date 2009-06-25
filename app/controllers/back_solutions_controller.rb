class BackSolutionsController < BaseController
  layout "back"
  
  def list#shwo
    @solutions = Solution.paginate( :page => params[:page], 
      :per_page => 10,
      :order => "updated_at DESC")
  end

  # GET /solutions/1
  # GET /solutions/1.xml
  def show
    if params[:list]
      @solution = Solution.find(:first,:conditions => [ "id = ?" , params[:list]])
    else 
      @solution = Solution.find(params[:id])
    end
   
  end

  # GET /solutions/new
  # GET /solutions/new.xml
  def new
    @solution_types =SolutionType.find(:all)   
    @solution = Solution.new
    
  end

  # GET /solutions/1/edit
  def edit
    @solution = Solution.find(params[:id])
    @solution_types =SolutionType.find(:all)   
  end

  # POST /solutions
  # POST /solutions.xml
  def create
    @solution = Solution.new(params[:solution])

    respond_to do |format|
      if @solution.save
        @solution.update_attribute(:solution_type_id,params[:industry])
        flash[:notice] = 'solution was successfully created.'
        format.html { redirect_to :action => 'list'  }
        format.xml  { render :xml => @solution, :status => :created, :location => @solution }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @solution.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /solutions/1
  # PUT /solutions/1.xml
  def update
    @solution = Solution.find(params[:id])

    respond_to do |format|
      if @solution.update_attributes(params[:solution])
        @solution.update_attribute(:solution_type_id,params[:industry])
        flash[:notice] = 'solution was successfully updated.'
        format.html { redirect_to :action => 'show', :id => @solution.id  }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @solution.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /solutions/1
  # DELETE /solutions/1.xml
  def destroy
    @solution = Solution.find(params[:id])
    @solution.destroy

    respond_to do |format|
      format.html { redirect_to :action => 'list' }
      format.xml  { head :ok }
    end
  end
  
  def company_col
    @company =About.find_by_name('company')
  end
  
  def company_new
    @company =About.find_by_name('company')
  end
  
  def create_company
    @about= About.find(params[:id])

    respond_to do |format|
      if @about.update_attributes(params[:about])
        flash[:notice] = 'successfully updated.'
        format.html { redirect_to :action => 'company_col' }
        format.xml  { head :ok }
      else
        format.html { render :action => "company_new" }
        format.xml  { render :xml => @solution.errors, :status => :unprocessable_entity }
      end
    end
  end
  
  def recent_col
    @recent =About.find_by_name('recent')
  end
  
  def recent_new
    @temp =About.find_by_name('recent')
    unless @temp
      @about =About.new
      @about.update_attribute(:name,'recent' )
      @about.save      
    end
    @recent =About.find_by_name('recent')
  end
  
  def create_recent
    @about= About.find(params[:id])
    respond_to do |format|
      if @about.update_attributes(params[:about])
        flash[:notice] = 'successfully updated.'
        format.html { redirect_to :action => 'recent_col' }
        format.xml  { head :ok }
      else
        format.html { render :action => "recent_new" }
        format.xml  { render :xml => @solution.errors, :status => :unprocessable_entity }
      end
    end
  end
end
