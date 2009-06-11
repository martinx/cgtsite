class EmployeesController < ApplicationController
  # Be sure to include AuthenticationSystem in Application Controller
  include AuthenticatedSystem
  #before_filter :login_required  , :except => [ :login ,:new]  

  # render new.rhtml
  def new
    @employee = Employee.new
  end

  def test
    
  end
  
  def ideaslist
    if params[:id]
      @ideas =Idea.find(:all,:conditions => [ "idea_type_id = ?" , params[:id]],:order =>'updated_at')
    else
      @ideas =Idea.find(:all,:order =>'updated_at')  
    end
  end
  
  def sendideas
    @idea =Idea.new
  end
  
  def create_ideas
    @idea = Idea.new(params[:idea])
    @idea.save
    redirect_to :action => 'ideaslist'
  end
  
  def comment
    if params[:id]
      @idea = Idea.find(params[:id])
    else
      @idea = Idea.find(:first,:conditions => [ "id = ?" , params[:idea_id]])
    end
    @comments = Comment.find(:all,:order =>'updated_at',:conditions => [ "idea_id = ?" , params[:id]])
    @comment = Comment.new
  end
  
  def create_comments
    @comment =Comment.new(params[:comment])
    @comment.save
    @comments = Comment.find(:all,:order =>'updated_at',:conditions => [ "idea_id = ?" , @comment.idea_id])
    render(:partial => 'com') 
    #redirect_to  :action => 'comment' ,:id =>@comment.idea_id
  end

  def create_employees
    cookies.delete :auth_token
    # protects against session fixation attacks, wreaks havoc with 
    # request forgery protection.
    # uncomment at your own risk
    # reset_session
    @employee = Employee.new(params[:employee])
    @employee.save
    if @employee.errors.empty?
      self.current_employee = @employee
      #redirect_back_or_default('/')
      flash[:notice] = "Thanks for signing up!"
    else
      render :action => 'new'
    end
  end
  
  def change_password
    @employee = Employee.find_by_id(current_employee.id)
    if @employee.crypted_password == Employee.encrypt(params[:old_password],@employee.salt)
      @employee.update_attributes(:password => params[:password], :password_confirmation => params[:password_confirmation])        
      flash[:note] ="password changed"
    else
      flash[:note] ="password is fault"         
    end
    render :action =>"setting"
  end
  
  def forgot_password
    if @employee = Employee.find_by_login(params[:login])   
      @employee.create_reset_code     
      flash[:notice] = "Reset code sent to #{@employee.email}"  
    else    
      flash[:notice] = "#{params[:login]} does not exist in system"    
    end    
    #redirect_back_or_default('/')
    render :action =>"forgot"
  end
  
  def modify
    @employee = Employee.find_by_reset_password_code(params[:reset_password_code])
    access_denied unless @employee
  end
  
  def reset_password
    if @employee.update_attributes(:password => params[:employee][:password], :password_confirmation => params[:employee][:password_confirmation])     
      self.current_employee = @employee       
      @employee.delete_reset_code      
      flash[:notice] = "Password reset successfully for #{@employee.email}"     
      #redirect_back_or_default('/')   
      render :action => 'modify'  
    else       
      render :action => 'modify'  
      flash[:notice] = "Password is not "        
    end  
  end


  ######################################################################################################
  # Method   : login_in
  # Parameter:
  #          1. :login       -
  #          2. :password    -
  #          3. :remember_me -
  #          4. :auth_token  -
  #          5. :admin       -
  #          6. :notice      -
  #
  # Function : Handle login operation in Employees logins page
  #          1. Get login information from parameters
  #          2. Check login operation information
  #          3. Validate name and password items not empty at the same time
  #          4. Empty, display error information on the page
  #          5. Check check_box remember me mark and set in table employee of DB
  #          6. Check if logged as an Admin then redirct to back_menu page or employee_page page
  #          7. Display login successful or login failed information
  #
  # Author   : Lin,     Gao
  # Date     : 2009-02, 2009-05 
  ######################################################################################################
  def login_in
    self.current_employee = Employee.authenticate(params[:login], params[:password])
    if logged_in?
      if params[:remember_me] == "1"                       # check if remember me mark is set
        current_employee.remember_me unless current_employee.remember_token?
        cookies[:auth_token] = { :value => self.current_employee.remember_token , :expires => self.current_employee.remember_token_expires_at }
      end
      @employee = Employee.find_by_login(params[:login])
      if  params[:adim] == 'Admin'                         # if logged as an Admin
        redirect_to :controller => 'back_menu'            # yes, as an Admin, then display back_menu page
      else                                                  # no, as an employee
        redirect_to :action => 'page'                     # then display employee's page page
      end
    else                                                    # when login is failed
      render :action => 'failed'                           # display login failed information
    end
  end


  def login_out
    self.current_employee.forget_me if logged_in?
    cookies.delete :auth_token
    reset_session
    flash[:notice] = "You have been logged out."
    #redirect_back_or_default('/')
    redirect_to :controller => 'employees' ,:action => 'login'
  end
end

