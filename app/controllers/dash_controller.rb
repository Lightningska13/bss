class DashController < ApplicationController
  def index
    @page_title= "Web|Print|Brand Solutions"
    @events= Event.find_for_home('Showcase', 'asc')
  end  
end
