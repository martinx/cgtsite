class SolutionsController < ApplicationController
  def index
   # @solutions = Solution.find(:all,:order => 'updated_at desc',:limit => 15 )
   @solutions=Solution.paginate :page=>params[:page],:per_page=>5
  end
  
  def find
    @search_text = params[:search_text]
    if @search_text
      @solutions = Solution.find_by_contents("*"+@search_text+"*").paginate(:page => params[:page], :per_page => 2,:order => 'updated_at desc')
    else
     # @solutions = Solution.paginate(:page => params[:page], :per_page => 6,:order => 'updated_at desc')
    end
  end
  
  def show
    @solution = Solution.find(params[:id])  
  end
end
