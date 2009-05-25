class ContactController < ApplicationController
  def index
    
  end
  
  def email
    ContactMail.deliver_contact(params[:contact])
    redirect_to :action =>"index"
  end
end
