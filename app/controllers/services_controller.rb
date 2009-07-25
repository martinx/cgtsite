class ServicesController < ApplicationController
  def index
     @services=Service.paginate :page=>params[:page],:per_page=>15
  end
  
  def find
    @page=params[:page]
    @keyWord=params[:keyWord]
    @per_page = 10

    if @page==nil||@page=="" 
      @page=1 
    end
    @services=Service.find_by_contents(@keyWord,:per_page=>@per_page,:page=>@page)
    @pages=page_for(@services,:page=>@page,:per_page=>@per_page)
  end
  
  def show
    @service = Service.find(params[:id])  
  end

  def type
    if params[:id]=='1'
      @htitle='System Integration'
    elsif params[:id]=='2'
      @htitle='Software Development'
    elsif params[:id]=='3'
      @htitle='Music Audio & Shows'
    elsif params[:id]=='4'
      @htitle='Consultant & Training'
    end
    @services=Service.paginate :page=>params[:page],:per_page=>15,:conditions=>['service_type_id=?',params[:id]]
  end
    end
