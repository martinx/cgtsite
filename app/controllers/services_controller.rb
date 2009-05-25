class ServicesController < ApplicationController
  def index
    @services = Service.find(:all,:order => 'updated_at desc',:limit =>15)
  end
  
  def find
    @page=params[:page]
    @keyWord=params[:keyWord]
    @per_page = 3
#    if @keyWord==nil||@keyWord==''
#      @keyWord=""
#    end
    if @page==nil||@page=="" 
      @page=1 
    end
#    @page=(@page==nil||@pge=="")?1:@page
    @services=Service.find_by_contents(@keyWord,:per_page=>@per_page,:page=>@page)
    #@pager=pages_for(@services,{:per_page=>@per_page,:page=>@page}) 
    #@search_text = params[:search_text]
    #if params[:id]
    # @services =Service.find(:all,:conditions => [ "client_id = ?", params[:id]] ).paginate(:page => params[:page], :per_page => 2,:order => 'updated_at desc') 
    #if @search_text
    #  @services = Service.find_by_contents("*"+@search_text+"*")
    #  @services = @services.paginate_search(:page => params[:page], :per_page => 4,:order => 'updated_at desc')
    # if @services.empty?
    #redirect_to :action => 'test' 
    # end
    #else
    #@services = Service.paginate(:page => params[:page], :per_page => 6,:order => 'updated_at desc')
#    @query=params[:search_text]
    #@services = Service.full_text_search("*"+@query+"*", :page => params[:page], :per_page => 2,:order => 'updated_at desc') 
    #@services = Service.paginate_search(@query , :page => params[:page], :per_page => 4,:order => 'updated_at desc')
    @services = Service.paginate(:page => params[:page], :per_page => 10,:order => 'updated_at desc',:conditions => [ "sl_title LIKE ? ", @query+"%"])
    
    #results = Service.full_text_search @query 
    #@services = pages_for(results,:per_page => 5)  
  end
  
  def show
    @service = Service.find(params[:id])  
  end

end
