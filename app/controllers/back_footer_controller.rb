class BackFooterController < ApplicationController
  def footer
    @footer =About.find_by_name('footer')
  end
  
  def footer_new
    @footer =About.find_by_name('footer')
  end
  
  def create_footer
    @about= About.find(params[:id])

    respond_to do |format|
      if @about.update_attributes(params[:about])
        flash[:notice] = 'successfully updated.'
        format.html { redirect_to :action => 'footer' }
        format.xml  { head :ok }
      else
        format.html { render :action => "footer_new" }
        format.xml  { render :xml => @service.errors, :status => :unprocessable_entity }
      end
    end
  end

end
