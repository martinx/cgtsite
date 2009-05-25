class PartnersController < ApplicationController
  def index
    @partners = Partner.find(:all)  
  end
end
