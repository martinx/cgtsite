class SolutionsController < ApplicationController
  def index
   # @solutions = Solution.find(:all,:order => 'updated_at desc',:limit => 15 )
   @solutions=Solution.paginate :page=>params[:page],:per_page=>5
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
    @solutions=Solution.find_by_contents(@keyWord,:per_page=>@per_page,:page=>@page)
    @pages=page_for(@solutions,:page=>@page,:per_page=>@per_page)

    
  end
  
  def show
    @solution = Solution.find(params[:id])  
  end
end
