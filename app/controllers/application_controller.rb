# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.
class ApplicationController < ActionController::Base
  helper :all # include  all helpers, all the time

  # See ActionController::RequestForgeryProtection for details
  # Uncomment the :secret if you're not using the cookie session store
  protect_from_forgery # :secret => 'a32e94aa3a5a452c26c9ad270466d790'
  
  # See ActionController::Base for details 
  # Uncomment this to filter the contents of submitted sensitive data parameters
  # from your application log (in this case, all fields with names like "password"). 
  # filter_parameter_logging :password
  
  def pages_for(result,options = {})     
    page, per_page, total = (options[:page] || 1),(options[:per_page] || 30),(result.total_hits || 0)   
    page_total = page * per_page   
    index = (page.to_i - 1) * per_page   
    pager = WillPaginate::Collection.new(page, per_page, page_total)   
    returning WillPaginate::Collection.new(page, per_page, total) do |pager|   
      pager.replace result[index,per_page]   
    end   
  end 

end
