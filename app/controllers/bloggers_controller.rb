class BloggersController < ApplicationController
 
  # render new.rhtml
  def new
  end

  def create
    cookies.delete :auth_token
    # protects against session fixation attacks, wreaks havoc with 
    # request forgery protection.
    # uncomment at your own risk
    # reset_session
    @blogger = Blogger.new(params[:blogger])
    @blogger.save
    if @blogger.errors.empty?
      self.current_blogger = @blogger
      flash[:notice] = "Thanks for signing up!"
      redirect_back_or_default('/')
    else
      render :action => 'new'
    end
  end

end
