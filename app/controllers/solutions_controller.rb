class SolutionsController < ApplicationController
  def index
   @solutions=Solution.paginate :page=>params[:page],:per_page=>5
  end
  
  def find
    @page=params[:page]
    @keyWord=params[:keyWord]
    @per_page = 3

    if @page==nil||@page==""
      @page=1
    end
    @solutions=Solution.find_by_contents(@keyWord,:per_page=>@per_page,:page=>@page)
    @pages=page_for(@solutions,:page=>@page,:per_page=>@per_page)
    
  end

  def type
    if params[:id]=="1"
      @htitle='Information'
    elsif params[:id]=="2"
      @htitle='Media'
    elsif params[:id]=="3"
      @htitle='Training'
    elsif params[:id]=="4"
      @htitle='Others'
    end
    @solutions=Solution.paginate :page=>params[:page],:per_page=>2,:conditions=>['solution_type_id=?',params[:id]]
  end
  
  def show
    @solution = Solution.find(params[:id])  
  end
end
