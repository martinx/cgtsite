class EmployeesController < ApplicationController
  # Be sure to include AuthenticationSystem in Application Controller instead
  include AuthenticatedSystem
  #before_filter :login_required  , :except => [ :login ,:new]  

  # render new.rhtml
  def new
    @employee = Employee.new
  end
  
  def login
    if logged_in?
      if params[:remember_me] == "1"
        current_employee.remember_me unless current_employee.remember_token?
        cookies[:auth_token] = { :value => self.current_employee.remember_token , :expires => self.current_employee.remember_token_expires_at }
      end
      #redirect_back_or_default('/')
      redirect_to :action => 'page'
      flash[:notice] = "Logged in successfully"
    else
      render :action => 'new'
    end
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

  def login_in
    self.current_employee = Employee.authenticate(params[:login], params[:password])
    if logged_in?
      if params[:remember_me] == "1"
        current_employee.remember_me unless current_employee.remember_token?
        cookies[:auth_token] = { :value => self.current_employee.remember_token , :expires => self.current_employee.remember_token_expires_at }
      end
      #redirect_back_or_default('/')
      @employee = Employee.find_by_login(params[:login])
#Gao      if @employee.admin == '1' && params[:adim] == 'Admin'
      if  params[:adim] == 'Admin'
        redirect_to :controller => 'back_menu'
      else
        redirect_to :action => 'page'
      end
      flash[:notice] = "Logged in successfully"
    else
      render :action => 'new'
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

